locals {
  tags = {
    "created-by" = "Terraform"

  }

  naming_convention_info = {
    name         = "eg"
    project_code = "knj"
    env          = "dev"
    zone         = "z1"
    agency_code  = "konjur"
    tier         = "web"
  }
}

module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags = {

      }
    }
  }
}



module "azure_dns_zone" {
  source                 = "../"
  resource_group_name    = var.resource_group_name
  dns_zone_name          = var.dns_zone_name
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags
  depends_on             = [module.resource_groups]
  soa_record = {
    001 = {
      email         = var.soa_record_email
      host_name     = var.soa_record_host_name
      expire_time   = var.soa_record_expire_time
      minimum_ttl   = var.soa_record_minimum_ttl
      refresh_time  = var.soa_record_refresh_time
      retry_time    = var.soa_record_retry_time
      serial_number = var.soa_record_serial_number
      ttl           = var.soa_record_ttl
      tags          = local.tags

    }
  }

  dns_a_record = {
    001 = {
      name    = "www"
      ttl     = var.dns_a_record_ttl
      records = ["192.168.10.1"]
      tags    = local.tags
    }
    002 = {
      name    = "portal"
      ttl     = var.dns_a_record_ttl
      records = ["192.168.10.2"]
      tags    = local.tags
    }
  }
}




