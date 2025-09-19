terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.45.0"
    }
    porkbun = {
      source = "kyswtn/porkbun"
      version = "0.1.3"
    }
  }
  required_version = ">= 1.9.7"
}

provider "azurerm" {
  features {}
  subscription_id = "1a4557a4-24e3-4167-a552-81234688c06e"
}

provider "porkbun" {
}
