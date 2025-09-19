resource_groups = {
  corenet       = { name = "rg-corenet-prod-uks-001",       location = "uksouth" }
  dnsgatekeeper = { name = "rg-dnsgatekeeper-prod-global-001", location = "uksouth" }
  terra         = { name = "rg-terra-prod-uks-001",         location = "ukwest"  }
}

vnets = {
  hub = {
    name          = "vnet-corenet-hub-prod-uks-001"
    address_space = ["10.240.0.0/21"]
    rg_key        = "corenet"
  }
  spoke = {
    name          = "vnet-corenet-spoke-prod-uks-001"
    address_space = ["10.241.0.0/21"]
    rg_key        = "corenet"
    subnets = {
      default = {
        name             = "snet-desktop-prod-uks-001"
        address_prefixes = ["10.241.0.0/26"]
      }
    }
  }
}

dns_zones = {
  public = {
    name   = "skyhaven.ltd"
    rg_key = "dnsgatekeeper"
  }
}

cname_records = {
  app = {
    name     = "app"
    record   = "app.azurewebsites.net"
    ttl      = 300
    zone_key = "public"
  }
}

network_watchers = {
  corenet = {
    name   = "nw-corenet-prod-uks-001"
    rg_key = "corenet"
  }
}

peerings = {
  hub_to_spoke = {
    name            = "hub-to-spoke"
  }
  spoke_to_hub = {
    name            = "spoke-to-hub"
  }
}
