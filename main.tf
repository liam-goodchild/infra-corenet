terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
  backend "azurerm" {
    key = "infra-corenet/terraform.tfstate"
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "corenet" {
  name = var.corenet_resource_group_name
  location = var.location
}

resource "azurerm_network_watcher" "watcher" {
  name = var.network_watcher_name
  location = var.location
  resource_group_name = azurerm_resource_group.corenet.name
}

resource "azurerm_virtual_network" "hub" {
  name = var.hub_vnet_name
  address_space = var.vnet_address_space
  location = var.location
  resource_group_name = azurerm_resource_group.corenet.name
}

resource "azurerm_virtual_network" "spoke" {
  name = var.spoke_vnet_name
  address_space = var.vnet_address_space
  location = var.location
  resource_group_name = azurerm_resource_group.corenet.name
}

resource "azurerm_resource_group" "dnsgatekeeper" {
  name = var.dnsgatekeeper_resource_group_name
  location = var.location
}

resource "azurerm_dns_zone" "dns" {
  name = var.dns_zone_name
  resource_group_name = azurerm_resource_group.dnsgatekeeper.name
}

resource "azurerm_resource_group" "tfstate" {
  name = var.tfstate_resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "tfstate" {
  name = var.tfstate_storage_account_name
  resource_group_name = var.tfstate_resource_group_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "tfstatecontainer" {
  name = var.tfstate_container_name
  storage_account_name = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}


