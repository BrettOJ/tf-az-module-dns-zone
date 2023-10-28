
resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "test"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_dns_zone.example.name
  virtual_network_id    = azurerm_virtual_network.example.id
  registration_enabled  = false
  tags = {
    "environment" = "development"
  }
}
