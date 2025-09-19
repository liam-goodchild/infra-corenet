resource "azurerm_dns_zone" "dns_zone" {
  name = var.name
  resource_group_name = var.resource_group_name
}

output "name_servers" {
  value = azurerm_dns_zone.dns_zone.name_servers
}