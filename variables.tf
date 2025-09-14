variable "location" {
  default = "uksouth"
}

variable "dnsgatekeeper_resource_group_name" {
  default = "rg-dnsgatekeeper-prod-global-001"
}

variable "corenet_resource_group_name" {
  default = "rg-corenet-prod-uks-001"
}

variable "tfstate_resource_group_name" {
  default = "rg-terra-prod-uks-001"
}

variable "hub_vnet_name" {
  default = "vnet-corenet-hub-prod-uks-001"
}

variable "spoke_vnet_name" {
  default = "vnet-corenet-spoke-prod-uks-001"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "tfstate_storage_account_name" {
  default = "stterraproduks001"
}

variable "tfstate_container_name" {
  default = "terraformstate"
}

variable "network_watcher_name" {
  default = "nw-corenet-prod-uks-001"
}

variable "dns_zone_name" {
  default = "skyhaven.ltd"
}