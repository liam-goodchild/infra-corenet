variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  type = map(object({
    name           = string
    address_space  = list(string)
    rg_key         = string
    subnets        = optional(map(object({
      name             = string
      address_prefixes = list(string)
    })), {})
  }))
}

variable "dns_zones" {
  type = map(object({
    name   = string
    rg_key = string
  }))
}

variable "cname_records" {
  type = map(object({
    name     = string
    record   = string
    ttl      = number
    zone_key = string
  }))
}

variable "network_watchers" {
  type = map(object({
    name   = string
    rg_key = string
  }))
}

variable "peerings" {
  type = map(object({
    name            = string
  }))
}