# terraform-aws-fortigate-vpn
[![tflint](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/workflows/tflint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/actions?query=workflow%3Atflint+event%3Apush+branch%3Amaster)
[![tfsec](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/workflows/tfsec/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/actions?query=workflow%3Atfsec+event%3Apush+branch%3Amaster)
[![yamllint](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/workflows/yamllint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amaster)
[![misspell](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/workflows/misspell/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amaster)
[![pre-commit-check](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/workflows/pre-commit-check/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-aws-fortigate-vpn/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amaster)
<a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=twitter" alt="follow on Twitter"></a>

Creates a site-to-site VPN connection intended to terminate to a FortiGate firewall. Creates a template configuration file that can be used to easily configure the connection.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2 |
| <a name="provider_local"></a> [local](#provider\_local) | >= 1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_psk1"></a> [psk1](#module\_psk1) | git::https://github.com/rhythmictech/terraform-aws-secretsmanager-random-secret | v1.1.1 |
| <a name="module_psk2"></a> [psk2](#module\_psk2) | git::https://github.com/rhythmictech/terraform-aws-secretsmanager-random-secret | v1.1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_customer_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway) | resource |
| [aws_vpn_connection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection) | resource |
| [local_file.this](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [aws_ec2_transit_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_transit_gateway) | data source |
| [aws_vpn_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpn_gateway) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | Name for AWS account side of tunnel | `string` | n/a | yes |
| <a name="input_customer_bgp_asn"></a> [customer\_bgp\_asn](#input\_customer\_bgp\_asn) | BGP for customer side of tunnel | `number` | n/a | yes |
| <a name="input_customer_gateway_type"></a> [customer\_gateway\_type](#input\_customer\_gateway\_type) | Type for customer gateway | `string` | `"ipsec.1"` | no |
| <a name="input_customer_ip_address"></a> [customer\_ip\_address](#input\_customer\_ip\_address) | IP address for customer side | `string` | n/a | yes |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | Name for customer side of tunnel | `string` | n/a | yes |
| <a name="input_generate_fortigate_config"></a> [generate\_fortigate\_config](#input\_generate\_fortigate\_config) | Generate a FortiGate config template (does not include PSKs) | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to supported resources | `map(string)` | `{}` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | Transit gateway to attach VPN to (required if `vpn_gateway_id` not set) | `string` | `null` | no |
| <a name="input_tunnel1_inside_cidr"></a> [tunnel1\_inside\_cidr](#input\_tunnel1\_inside\_cidr) | Specify a Tunnel 1 inside CIDR (optional) | `string` | `""` | no |
| <a name="input_tunnel1_psk"></a> [tunnel1\_psk](#input\_tunnel1\_psk) | Specify a Tunnel 1 PSK explicitly (optional) | `string` | `""` | no |
| <a name="input_tunnel1_psk_version"></a> [tunnel1\_psk\_version](#input\_tunnel1\_psk\_version) | Version to use for PSK (increment to generate a new PSK) | `number` | `1` | no |
| <a name="input_tunnel2_inside_cidr"></a> [tunnel2\_inside\_cidr](#input\_tunnel2\_inside\_cidr) | Specify a Tunnel 2 inside CIDR (optional) | `string` | `""` | no |
| <a name="input_tunnel2_psk"></a> [tunnel2\_psk](#input\_tunnel2\_psk) | Specify a Tunnel 2 PSK explicitly (optional) | `string` | `""` | no |
| <a name="input_tunnel2_psk_version"></a> [tunnel2\_psk\_version](#input\_tunnel2\_psk\_version) | Version to use for PSK (increment to generate a new PSK) | `number` | `1` | no |
| <a name="input_use_secrets_manager"></a> [use\_secrets\_manager](#input\_use\_secrets\_manager) | Use Secrets Manager to store/manage PSKs | `bool` | `true` | no |
| <a name="input_use_tgw"></a> [use\_tgw](#input\_use\_tgw) | Set to true if attaching the VPN to a Transit Gateway | `bool` | `false` | no |
| <a name="input_vgw_id"></a> [vgw\_id](#input\_vgw\_id) | Virtual Private Gateway to attach VPN to (required if `transit_gateway_id` not set) | `string` | `null` | no |
| <a name="input_wan_interface"></a> [wan\_interface](#input\_wan\_interface) | WAN interface to use in fortigate config template | `string` | `"wan1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_customer_gateway_bgp_asn"></a> [customer\_gateway\_bgp\_asn](#output\_customer\_gateway\_bgp\_asn) | Customer Gateway BGP ASN |
| <a name="output_customer_gateway_id"></a> [customer\_gateway\_id](#output\_customer\_gateway\_id) | Customer Gateway ID |
| <a name="output_customer_gateway_ip_address"></a> [customer\_gateway\_ip\_address](#output\_customer\_gateway\_ip\_address) | Customer Gateway IP Address |
| <a name="output_vpn_connection_tunnel1_address"></a> [vpn\_connection\_tunnel1\_address](#output\_vpn\_connection\_tunnel1\_address) | Tunnel 1 Public IP Address |
| <a name="output_vpn_connection_tunnel1_bgp_asn"></a> [vpn\_connection\_tunnel1\_bgp\_asn](#output\_vpn\_connection\_tunnel1\_bgp\_asn) | Tunnel 1 BGP ASN |
| <a name="output_vpn_connection_tunnel1_cgw_inside_address"></a> [vpn\_connection\_tunnel1\_cgw\_inside\_address](#output\_vpn\_connection\_tunnel1\_cgw\_inside\_address) | Tunnel 1 Customer Inside IP Address |
| <a name="output_vpn_connection_tunnel1_preshared_key"></a> [vpn\_connection\_tunnel1\_preshared\_key](#output\_vpn\_connection\_tunnel1\_preshared\_key) | Tunnel 1 Preshared Key |
| <a name="output_vpn_connection_tunnel1_vgw_inside_address"></a> [vpn\_connection\_tunnel1\_vgw\_inside\_address](#output\_vpn\_connection\_tunnel1\_vgw\_inside\_address) | Tunnel 1 AWS Inside IP Address |
| <a name="output_vpn_connection_tunnel2_address"></a> [vpn\_connection\_tunnel2\_address](#output\_vpn\_connection\_tunnel2\_address) | Tunnel 2 Public IP Address |
| <a name="output_vpn_connection_tunnel2_bgp_asn"></a> [vpn\_connection\_tunnel2\_bgp\_asn](#output\_vpn\_connection\_tunnel2\_bgp\_asn) | Tunnel 2 BGP ASN |
| <a name="output_vpn_connection_tunnel2_cgw_inside_address"></a> [vpn\_connection\_tunnel2\_cgw\_inside\_address](#output\_vpn\_connection\_tunnel2\_cgw\_inside\_address) | Tunnel 2 Customer Inside IP Address |
| <a name="output_vpn_connection_tunnel2_preshared_key"></a> [vpn\_connection\_tunnel2\_preshared\_key](#output\_vpn\_connection\_tunnel2\_preshared\_key) | Tunnel 2 Preshared Key |
| <a name="output_vpn_connection_tunnel2_vgw_inside_address"></a> [vpn\_connection\_tunnel2\_vgw\_inside\_address](#output\_vpn\_connection\_tunnel2\_vgw\_inside\_address) | Tunnel 2 AWS Inside IP Address |
| <a name="output_vpn_connection_vpn_gw_id"></a> [vpn\_connection\_vpn\_gw\_id](#output\_vpn\_connection\_vpn\_gw\_id) | VPN Gateway ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
