targetScope = 'subscription'

param rgName string
param rgLocation string

resource resourceGroupPvtDns 'br/public:avm/res/resources/resource-group:0.2.2' = {
  name: rgName
  location: rgLocation
}

@sys.description('Create private DNS zones in the specified regions. By default all regions are used.')
@minLength(1)
@allowed([
  'westeurope'
  'northeurope'
  'eastus'
  'eastus2'
  'southcentralus'
  'westus'
  'westus2'
  'centralus'
  'northcentralus'
  'southcentralus'
  'eastasia'
  'southeastasia'
  'japaneast'
  'japanwest'
  'australiaeast'
  'australiasoutheast'
  'australiacentral'
  'australiacentral2'
  'brazilsouth'
  'southafricanorth'
  'southafricawest'
  'norwayeast'
  'norwaywest'
  'switzerlandnorth'
  'switzerlandwest'
  'germanynorth'
  'germanywestcentral'
  'ukwest'
  'uksouth'
  'francecentral'
  'francesouth'
  'koreacentral'
  'koreasouth'
  'canadacentral'
  'canadaeast'
  'usgovvirginia'
  'usgoviowa'
  'usgovarizona'
  'usgovtexas'
  'usdodcentral'
  'usdodeast'
])
param regions string[] = [
  'westeurope'
  'northeurope'
  'eastus'
  'eastus2'
  'southcentralus'
  'westus'
  'westus2'
  'centralus'
  'northcentralus'
  'southcentralus'
  'eastasia'
  'southeastasia'
  'japaneast'
  'japanwest'
  'australiaeast'
  'australiasoutheast'
  'australiacentral'
  'australiacentral2'
  'brazilsouth'
  'southafricanorth'
  'southafricawest'
  'norwayeast'
  'norwaywest'
  'switzerlandnorth'
  'switzerlandwest'
  'germanynorth'
  'germanywestcentral'
  'ukwest'
  'uksouth'
  'francecentral'
  'francesouth'
  'koreacentral'
  'koreasouth'
  'canadacentral'
  'canadaeast'
  'usgovvirginia'
  'usgoviowa'
  'usgovarizona'
  'usgovtexas'
  'usdodcentral'
  'usdodeast'
]

// @sys.description('The name of the resource group to create the private DNS zones in.')
// @minLength(3)
// param resourceGroupName string

@sys.description('The resource IDs of the virtual networsk to add the private DNS zones to.')
@minLength(1)
param vnetResourceId string[]

// module resourceGroup 'modules/resourcegroup.bicep' = {
//   name: '${uniqueString(deployment().name)}-resourceGroup'
//   scope: subscription()
//   params: {
//     resourceGroupName: resourceGroupName
//   }
// }

module privateDnsZones 'modules/privateDnsZone.bicep' = {
  scope: resourceGroupPvtDns
  name: '${uniqueString(deployment().name)}-privateDnsZones'
  params: {
    resourceGroupName: rgName
    regions: regions
    vnetResourceId: vnetResourceId
  }
}
