terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "corenet" {
  name     = var.corenet_resource_group_name
  location = var.location
}

resource "azurerm_resource_group" "dnsgatekeeper" {
  name     = var.dnsgatekeeper_resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "hub" {
  name                = var.hub_vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.corenet.name
}

resource "azurerm_virtual_network" "spoke" {
  name                = var.spoke_vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.corenet.name
}