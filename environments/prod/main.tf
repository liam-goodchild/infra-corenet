module "rg_corenet" {
  source   = "../../modules/resource_group"
  name     = var.resource_groups["corenet"].name
  location = var.resource_groups["corenet"].location
}

module "rg_dnsgatekeeper" {
  source   = "../../modules/resource_group"
  name     = var.resource_groups["dnsgatekeeper"].name
  location = var.resource_groups["dnsgatekeeper"].location
}

module "vnet_hub" {
  source              = "../../modules/virtual_network"
  name                = var.vnets["hub"].name
  address_space       = var.vnets["hub"].address_space
  resource_group_name = module.rg_corenet.name
  location            = module.rg_corenet.location
}

module "vnet_spoke" {
  source              = "../../modules/virtual_network"
  name                = var.vnets["spoke"].name
  address_space       = var.vnets["spoke"].address_space
  resource_group_name = module.rg_corenet.name
  location            = module.rg_corenet.location
  subnets             = var.vnets["spoke"].subnets
}

module "peering_hub_to_spoke" {
  source                  = "../../modules/virtual_network_peering"
  name                    = var.peerings["hub_to_spoke"].name
  virtual_network_name    = module.vnet_hub.name
  resource_group_name     = module.rg_corenet.name
  remote_virtual_network_id = module.vnet_spoke.id
}

module "peering_spoke_to_hub" {
  source                  = "../../modules/virtual_network_peering"
  name                    = var.peerings["spoke_to_hub"].name
  virtual_network_name    = module.vnet_spoke.name
  resource_group_name     = module.rg_corenet.name
  remote_virtual_network_id = module.vnet_hub.id
}

module "network_watcher" {
  source              = "../../modules/network_watcher"
  name                = var.network_watchers["corenet"].name
  resource_group_name = module.rg_corenet.name
  location            = module.rg_corenet.location
}

module "dns_zone" {
  source              = "../../modules/dns_zone"
  name                = var.dns_zones["public"].name
  resource_group_name = module.rg_dnsgatekeeper.name
}

resource "porkbun_nameservers" "domain_ns" {
  domain      = "skyhaven.ltd"
  nameservers = module.dns_zone.name_servers
}