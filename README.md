## Current capabilities

Deploys:

- Hub and spoke VNets
- Public DNS zone and returns assigned name server
- Storage account and container for housing remote state files
- Network Watcher for the UK South region
- Houses all of the above in designated resource groups

## To do

- [x] Correct overlapping address space between VNets
- [x] Configure peerings between the VNets
- [x] Configure subnets for application/VM use
- [x] Refactor monolithic repo into modules and environments
- [ ] Correct VNet peering code (do both sides of the peering need to be defined in IaC)
- [ ] Make API call to Porkbun to automatically update name servers after deployment
- [ ] Configure DNS zone to house portfolio.skyhaven.ltd and dev.portfolio.skyhaven.ltd records