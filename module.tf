resource "azurerm_dns_zone" "pub_dnszone" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_dns_a_record" "dns_a_record_obj" {
  for_each = var.dns_a_record == null ? {} : { 1 = 1 }

  name                = each.value.name
  zone_name           = var.dns_zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
  depends_on = [azurerm_dns_zone.pub_dnszone]
}

# resource "azurerm_private_dns_cname_record" "dns_cname_record_obj" {
#   count               = length(var.dns_cname_record) 
#   name                = element(var.dns_cname_record[count.index], 0)
#   zone_name           = var.private_dns_zone_name
#   resource_group_name = var.resource_group_name
#   ttl                 = element(var.dns_cname_record[count.index], 1)
#   record              = element(var.dns_cname_record[count.index], 2)
# }
