# terraform-aws-fortigate-vpn

Creates a site-to-site VPN connection intended to terminate to a FortiGate firewall. Creates a template configuration file that can be used to easily configure the connection.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| account\_name | Name for AWS account side of tunnel | string | n/a | yes |
| customer\_bgp\_asn | BGP for customer side of tunnel | number | n/a | yes |
| customer\_gateway\_type | Type for customer gateway | string | `"ipsec.1"` | no |
| customer\_ip\_address | IP address for customer side | string | n/a | yes |
| customer\_name | Name for customer side of tunnel | string | n/a | yes |
| generate\_fortigate\_config | Generate a FortiGate config template \(does not include PSKs\) | bool | `"true"` | no |
| tags | Tags to add to supported resources | string | n/a | yes |
| transit\_gateway\_id | Transit gateway to attach VPN to \(required if `vpn\_gateway\_id` not set\) | string | `"null"` | no |
| tunnel1\_inside\_cidr | Specify a Tunnel 1 inside CIDR \(optional\) | string | `""` | no |
| tunnel1\_psk | Specify a Tunnel 1 PSK explicitly \(optional\) | string | `""` | no |
| tunnel1\_psk\_version | Version to use for PSK \(increment to generate a new PSK\) | number | `"1"` | no |
| tunnel2\_inside\_cidr | Specify a Tunnel 2 inside CIDR \(optional\) | string | `""` | no |
| tunnel2\_psk | Specify a Tunnel 2 PSK explicitly \(optional\) | string | `""` | no |
| tunnel2\_psk\_version | Version to use for PSK \(increment to generate a new PSK\) | number | `"1"` | no |
| use\_secrets\_manager | Use Secrets Manager to store/manage PSKs | bool | `"true"` | no |
| vgw\_id | Virtual Private Gateway to attach VPN to \(required if `transit\_gateway\_id` not set\) | string | `"null"` | no |
| wan\_interface | WAN interface to use in fortigate config template | string | `"wan1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| customer\_gateway\_bgp\_asn | Customer Gateway BGP ASN |
| customer\_gateway\_id | Customer Gateway ID |
| customer\_gateway\_ip\_address | Customer Gateway IP Address |
| vpn\_connection\_tunnel1\_address | Tunnel 1 Public IP Address |
| vpn\_connection\_tunnel1\_bgp\_asn | Tunnel 1 BGP ASN |
| vpn\_connection\_tunnel1\_cgw\_inside\_address | Tunnel 1 Customer Inside IP Address |
| vpn\_connection\_tunnel1\_preshared\_key | Tunnel 1 Preshared Key |
| vpn\_connection\_tunnel1\_vgw\_inside\_address | Tunnel 1 AWS Inside IP Address |
| vpn\_connection\_tunnel2\_address | Tunnel 2 Public IP Address |
| vpn\_connection\_tunnel2\_bgp\_asn | Tunnel 2 BGP ASN |
| vpn\_connection\_tunnel2\_cgw\_inside\_address | Tunnel 2 Customer Inside IP Address |
| vpn\_connection\_tunnel2\_preshared\_key | Tunnel 2 Preshared Key |
| vpn\_connection\_tunnel2\_vgw\_inside\_address | Tunnel 2 AWS Inside IP Address |
| vpn\_connection\_vpn\_gw\_id | VPN Gateway ID |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
