variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group."
}

variable "dns_zone_name" {
  type        = string
  description = "The name of the Private DNS Zone. Must be a valid domain name."
}

variable "dns_a_record" {
  type = map(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
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

variable "soa_record" {
  type = map(object({
    email         = string
    host_name     = string
    expire_time   = number
    minimum_ttl   = number
    refresh_time  = number
    retry_time    = number
    serial_number = number
    ttl           = number
    tags          = map(string)
  }))
  description = "Describes, [0] The email address of the person responsible for the zone. [1] The time in seconds that any name server or resolver should cache a negative response. [2] The time in seconds that any name server or resolver should cache a result. [3] The time in seconds that any name server or resolver should wait before trying to refresh the zone. [4] The time in seconds that any name server or resolver should wait before trying to retry a failed zone refresh. [5] The serial number of the zone. [6] The time in seconds that any name server or resolver should wait before trying to retry a failed zone transfer. "

}

variable "naming_convention_info" {
  type        = map(any)
  description = "Describes, [0] The name of the resource. [1] The project code. [2] The environment. [3] The zone. [4] The agency code. [5] The tier. "

}
