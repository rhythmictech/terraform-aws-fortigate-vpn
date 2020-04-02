variable "account_name" {
  description = "Name for AWS account side of tunnel"
  type        = string
}

variable "customer_bgp_asn" {
  description = "BGP for customer side of tunnel"
  type        = number
}

variable "customer_ip_address" {
  description = "IP address for customer side"
  type        = string
}

variable "customer_gateway_type" {
  default     = "ipsec.1"
  description = "Type for customer gateway"
  type        = string
}

variable "customer_name" {
  description = "Name for customer side of tunnel"
  type        = string
}

variable "generate_fortigate_config" {
  default     = true
  description = "Generate a FortiGate config template (does not include PSKs)"
  type        = bool
}

variable "tags" {
  description = "Tags to add to supported resources"
}

variable "transit_gateway_id" {
  default     = null
  description = "Transit gateway to attach VPN to (required if `vpn_gateway_id` not set)"
  type        = string
}

variable "tunnel1_inside_cidr" {
  default     = ""
  description = "Specify a Tunnel 1 inside CIDR (optional)"
  type        = string
}

variable "tunnel1_psk" {
  default     = ""
  description = "Specify a Tunnel 1 PSK explicitly (optional)"
  type        = string
}

variable "tunnel1_psk_version" {
  default     = 1
  description = "Version to use for PSK (increment to generate a new PSK)"
  type        = number
}

variable "tunnel2_inside_cidr" {
  default     = ""
  description = "Specify a Tunnel 2 inside CIDR (optional)"
  type        = string
}

variable "tunnel2_psk" {
  default     = ""
  description = "Specify a Tunnel 2 PSK explicitly (optional)"
  type        = string
}

variable "tunnel2_psk_version" {
  default     = 1
  description = "Version to use for PSK (increment to generate a new PSK)"
  type        = number
}

variable "use_secrets_manager" {
  default     = true
  description = "Use Secrets Manager to store/manage PSKs"
  type        = bool
}

variable "vgw_id" {
  default     = null
  description = "Virtual Private Gateway to attach VPN to (required if `transit_gateway_id` not set)"
  type        = string
}

variable "wan_interface" {
  default     = "wan1"
  description = "WAN interface to use in fortigate config template"
  type        = string
}
