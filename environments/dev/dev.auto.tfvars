resource_groups = {
  corenet       = { name = "rg-corenet-dev-uks-001",       location = "uksouth" }
  dnsgatekeeper = { name = "rg-dnsgatekeeper-dev-global-001", location = "uksouth" }
}

vnets = {
  hub = {
    name          = "vnet-corenet-hub-dev-uks-001"
    address_space = ["10.240.0.0/21"]
    rg_key        = "corenet"
  }
  spoke = {
    name          = "vnet-corenet-spoke-dev-uks-001"
    address_space = ["10.241.0.0/21"]
    rg_key        = "corenet"
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
    name   = "nw-corenet-dev-uks-001"
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
