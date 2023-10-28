output "dnszone_id_output" {
  description = "Output the private DNS zone ID"
  value       = azurerm_dns_zone.pub_dnszone.*.id
}
