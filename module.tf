resource "azurerm_dns_zone" "pub_dnszone" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags

  dynamic "soa_record" {
    for_each = var.soa_record == null ? var.soa_record : {}
    content {
      email         = soa_record.value.email
      host_name     = soa_record.value.host_name
      expire_time   = soa_record.value.expire_time
      minimum_ttl   = soa_record.value.minimum_ttl
      refresh_time  = soa_record.value.refresh_time
      retry_time    = soa_record.value.retry_time
      serial_number = soa_record.value.serial_number
      ttl           = soa_record.value.ttl
      tags          = soa_record.value.tags
    }
  }

}
resource "azurerm_dns_a_record" "dns_a_record_obj" {
  for_each            = var.dns_a_record
  name                = each.value.name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
  depends_on          = [azurerm_dns_zone.pub_dnszone]
}

# resource "azurerm_private_dns_cname_record" "dns_cname_record_obj" {
#   count               = length(var.dns_cname_record) 
#   name                = element(var.dns_cname_record[count.index], 0)
#   zone_name           = var.private_dns_zone_name
#   resource_group_name = var.resource_group_name
#   ttl                 = element(var.dns_cname_record[count.index], 1)
#   record              = element(var.dns_cname_record[count.index], 2)
# }
