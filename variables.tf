variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group."
}

variable "dns_zone_name" {
  type        = string
  description = "The name of the Private DNS Zone. Must be a valid domain name."
}

variable "dns_a_record" {
  type        = map
  description = "Describes, [0] The name of the DNS A Record. [1]The Time To Live (TTL) of the DNS record in seconds. [2] List of IPv4 Addresses. "
  
}

# variable "dns_cname_record" {
#   type        = map
#   description = "Describes, [0] The name of the DNS A Record. [1]The Time To Live (TTL) of the DNS record in seconds. [2] The target of the CNAME. "

# }

variable "tags" {
  type        = map(string)
  description = "Specify the tags to the resource. Additional tags will be appended based on the convention"
}