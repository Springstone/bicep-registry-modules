@sys.description('Create private DNS zones in the specified regions. By default all regions are used.')
param regionsZ string[]

// @sys.description('The name of the resource group to create the private DNS zones in.')
// @minLength(3)
// param resourceGroupName string

// @sys.description('The resource IDs of the virtual networsk to add the private DNS zones to.')
// @minLength(1)
// param vnetResourceId string[]

module privateDnsZones 'br/public:avm/res/network/private-dns-zone:0.2.3' = [for region in regionsZ: {
  name: '${uniqueString(deployment().name)}-privateDnsZones'
  params: {
    name: 'privateDnsZones'
    location: 'global'
  }
}
]
