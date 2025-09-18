resource "azurerm_resource_group" "resource_group" {
  name     = var.name
  location = var.location
}

output "name" {
  value       = azurerm_resource_group.resource_group.name
}

output "location" {
  value       = azurerm_resource_group.resource_group.location
}