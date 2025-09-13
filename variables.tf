variable "location" {
  default = "uksouth"
}

variable "dnsgatekeeper_resource_group_name" {
  default = "rg-dnsgatekeeper-prod-uks-001"
}

variable "corenet_resource_group_name" {
  default = "rg-corenet-prod-uks-001"
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