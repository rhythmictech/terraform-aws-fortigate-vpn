output "customer_gateway_bgp_asn" {
  description = "Customer Gateway BGP ASN"
  value       = aws_customer_gateway.this.bgp_asn
}

output "customer_gateway_id" {
  description = "Customer Gateway ID"
  value       = aws_customer_gateway.this.id
}

output "customer_gateway_ip_address" {
  description = "Customer Gateway IP Address"
  value       = aws_customer_gateway.this.ip_address
}

output "vpn_connection_tunnel1_address" {
  description = "Tunnel 1 Public IP Address"
  value       = aws_vpn_connection.this.tunnel1_address
}

output "vpn_connection_tunnel1_bgp_asn" {
  description = "Tunnel 1 BGP ASN"
  value       = aws_vpn_connection.this.tunnel1_bgp_asn
}
output "vpn_connection_tunnel1_cgw_inside_address" {
  description = "Tunnel 1 Customer Inside IP Address"
  value       = aws_vpn_connection.this.tunnel1_cgw_inside_address
}

output "vpn_connection_tunnel1_preshared_key" {
  description = "Tunnel 1 Preshared Key"
  value       = aws_vpn_connection.this.tunnel1_preshared_key
}

output "vpn_connection_tunnel1_vgw_inside_address" {
  description = "Tunnel 1 AWS Inside IP Address"
  value       = aws_vpn_connection.this.tunnel1_vgw_inside_address
}

output "vpn_connection_tunnel2_address" {
  description = "Tunnel 2 Public IP Address"
  value       = aws_vpn_connection.this.tunnel2_address
}

output "vpn_connection_tunnel2_bgp_asn" {
  description = "Tunnel 2 BGP ASN"
  value       = aws_vpn_connection.this.tunnel2_bgp_asn
}

output "vpn_connection_tunnel2_cgw_inside_address" {
  description = "Tunnel 2 Customer Inside IP Address"
  value       = aws_vpn_connection.this.tunnel2_cgw_inside_address
}

output "vpn_connection_tunnel2_preshared_key" {
  description = "Tunnel 2 Preshared Key"
  value       = aws_vpn_connection.this.tunnel2_preshared_key
}

output "vpn_connection_tunnel2_vgw_inside_address" {
  description = "Tunnel 2 AWS Inside IP Address"
  value       = aws_vpn_connection.this.tunnel2_vgw_inside_address
}

output "vpn_connection_vpn_gw_id" {
  description = "VPN Gateway ID"
  value       = aws_vpn_connection.this.id
}
