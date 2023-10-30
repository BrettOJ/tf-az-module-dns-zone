variable "resource_group_name" {
  type    = string
  default = "example-rg"

}

variable "dns_zone_name" {
  type    = string
  default = "example.com"
}

variable "location" {
  type    = string
  default = "southeastasia"

}

variable "soa_record_email" {
  type    = string
  default = null
}

variable "soa_record_expire_time" {
  type    = number
  default = 1800

}

variable "soa_record_minimum_ttl" {
  type    = number
  default = 300

}

variable "soa_record_refresh_time" {
  type    = number
  default = 900

}

variable "soa_record_host_name" {
  type    = string
  default = null
}

variable "soa_record_retry_time" {
  type    = number
  default = 300

}

variable "soa_record_serial_number" {
  type    = number
  default = 1

}

variable "soa_record_ttl" {
  type    = number
  default = 3600

}

variable "dns_a_record_ttl" {
  type    = number
  default = 3600

}
