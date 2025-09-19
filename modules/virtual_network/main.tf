resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  dynamic "subnet" {
    for_each = var.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}

output "name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "id" {
  value = azurerm_virtual_network.virtual_network.id
}