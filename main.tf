data "aws_vpn_gateway" "this" {
  count = var.use_tgw ? 0 : 1
  id    = var.vgw_id
}

data "aws_ec2_transit_gateway" "this" {
  count = var.use_tgw ? 1 : 0
  id    = var.transit_gateway_id
}

#tfsec:ignore:aws-ssm-secret-use-customer-key
module "psk1" {
  source           = "git::https://github.com/rhythmictech/terraform-aws-secretsmanager-random-secret?ref=v1.1.1"
  name             = "${var.account_name}/${var.customer_name}-psk1-secret"
  create_secret    = var.use_secrets_manager
  length           = 40
  min_special      = 3
  override_special = "._"
  pass_version     = var.tunnel1_psk_version
  use_special      = true
  tags             = var.tags
}

#tfsec:ignore:aws-ssm-secret-use-customer-key
module "psk2" {
  source           = "git::https://github.com/rhythmictech/terraform-aws-secretsmanager-random-secret?ref=v1.1.1"
  name             = "${var.account_name}/${var.customer_name}-psk2-secret"
  create_secret    = var.use_secrets_manager
  length           = 40
  min_special      = 3
  override_special = "._"
  pass_version     = var.tunnel2_psk_version
  tags             = var.tags
  use_special      = true
}

locals {

  tags_with_name = merge(var.tags, {
    "Name" = "${var.account_name}<=>${var.customer_name}"
    }
  )

  tgw_id      = var.use_tgw ? var.transit_gateway_id : null
  tunnel1_psk = var.use_secrets_manager ? module.psk1.secret : var.tunnel1_psk
  tunnel2_psk = var.use_secrets_manager ? module.psk2.secret : var.tunnel2_psk
  vgw_id      = var.use_tgw ? null : var.vgw_id

  # compute aws bgp asn
  amazon_bgp_asn = try(data.aws_ec2_transit_gateway.this[0].amazon_side_asn, data.aws_vpn_gateway.this[0].amazon_side_asn)
}

resource "aws_customer_gateway" "this" {
  bgp_asn    = var.customer_bgp_asn
  ip_address = var.customer_ip_address
  tags       = local.tags_with_name
  type       = var.customer_gateway_type
}

resource "aws_vpn_connection" "this" {
  customer_gateway_id   = aws_customer_gateway.this.id
  tags                  = local.tags_with_name
  transit_gateway_id    = local.tgw_id
  tunnel1_inside_cidr   = var.tunnel1_inside_cidr
  tunnel1_preshared_key = local.tunnel1_psk
  tunnel2_inside_cidr   = var.tunnel2_inside_cidr
  tunnel2_preshared_key = local.tunnel2_psk
  type                  = aws_customer_gateway.this.type
  vpn_gateway_id        = local.vgw_id
}

resource "local_file" "this" {
  count = var.generate_fortigate_config ? 1 : 0
  content = templatefile("${path.module}/fortigate_config.txt.tpl",
    {
      account_name                    = var.account_name
      amazon_bgp_asn                  = local.amazon_bgp_asn
      customer_bgp_asn                = var.customer_bgp_asn
      customer_ip_address             = var.customer_ip_address
      customer_name                   = var.customer_name
      shortname                       = substr(var.account_name, 0, 14)
      tunnel1_address                 = aws_vpn_connection.this.tunnel1_address
      tunnel1_inside_address_amazon   = aws_vpn_connection.this.tunnel1_vgw_inside_address
      tunnel1_inside_address_customer = aws_vpn_connection.this.tunnel1_cgw_inside_address
      tunnel2_address                 = aws_vpn_connection.this.tunnel2_address
      tunnel2_inside_address_amazon   = aws_vpn_connection.this.tunnel2_vgw_inside_address
      tunnel2_inside_address_customer = aws_vpn_connection.this.tunnel2_cgw_inside_address
      wan_interface                   = var.wan_interface
    }
  )
  filename = "${var.account_name}-${var.customer_name}-fortigate_config.txt"
}
