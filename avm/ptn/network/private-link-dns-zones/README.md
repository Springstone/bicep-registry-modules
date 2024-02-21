targetScope = 'resourceGroup'

param resourceGroupPvtDNSName string = 'pvt-dns-rg'

@sys.description('The location of the private DNS zone. This is the location of the resource group that contains the private DNS zone.')
@sys.allowed(
  [ 'uksouth', 'ukwest', 'westus', 'westus2', 'centralus', 'eastus', 'eastus2', 'northcentralus', 'southcentralus', 'westcentralus', 'canadacentral', 'canadaeast', 'brazilsouth', 'brazilse', 'northeurope', 'westeurope', 'francecentral', 'francesouth', 'germanywestcentral', 'germanynortheast', 'switzerlandnorth', 'switzerlandwest', 'norwayeast', 'norwaywest', 'eastasia', 'southeastasia', 'japaneast', 'japanwest', 'australiaeast', 'australiasoutheast', 'australiacentral', 'australiacentral2', 'southindia', 'centralindia', 'westindia', 'koreacentral', 'koreasouth', 'southafricanorth', 'southafricawest', 'uaenorth', 'uaecentral', 'southcentralus', 'westus', 'westus2', 'centralus', 'eastus', 'eastus2', 'northcentralus', 'southcentralus', 'westcentralus', 'canadacentral', 'canadaeast', 'brazilsouth', 'brazilsoutheast', 'northeurope', 'westeurope', 'francecentral', 'francesouth', 'germanywestcentral', 'germanynortheast', 'switzerlandnorth', 'switzerlandwest', 'norwayeast', 'norwaywest', 'eastasia' ]
)
param resourceGroupPvtDnsLocation string = 'uksouth'

param privateDNSZoneName array

param virtualNetworkId string

resource resourceGroupPvtDns 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: resourceGroupPvtDNSName
  location: resourceGroupPvtDnsLocation
}

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2018-09-01' = [for zone in privateDNSZoneName: {
  name: zone
  resourceGroup: resourceGroupPvtDns.name
}]
