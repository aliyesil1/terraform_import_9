resource "azurerm_resource_group" "api_rg" {
    name = var.rg_name
    location = var.rg_location  
    tags = {
    "costcenter" = "101"
    }
}
resource "azurerm_resource_group" "ali_import9_test" {
    name = "terraform_import9_test"
    location = var.rg_location
    tags = {
    "costcenter" = "101"
    }
}
resource "azurerm_virtual_network" "testNetwork" {
    location = azurerm_resource_group.ali_import9_test.location
    address_space = ["10.0.0.0/19","192.168.0.0/24"]
    name = "test-nw"
    resource_group_name = azurerm_resource_group.ali_import9_test.name
    tags = {
    "env" = "test"
    }
}
resource "azurerm_subnet" "defaultsubnet" {
  name = "default"
  resource_group_name = azurerm_resource_group.ali_import9_test.name
  virtual_network_name = azurerm_virtual_network.testNetwork.name
  address_prefixes = [ "10.0.0.0/24" ]
}
resource "azurerm_subnet" "dbsubnet" {
  name = "db"
  resource_group_name = azurerm_resource_group.ali_import9_test.name
  virtual_network_name = azurerm_virtual_network.testNetwork.name
  address_prefixes = [ "10.0.2.0/24" ]
  service_endpoints = ["Microsoft.Sql"]
}
resource "azurerm_subnet" "appsubnet" {
  name = "app"
  resource_group_name = azurerm_resource_group.ali_import9_test.name
  virtual_network_name = azurerm_virtual_network.testNetwork.name
  address_prefixes = [ "10.0.1.0/24" ]
}

   # terraform import azurerm_virtual_network.testNetwork /subscriptions/ed960394-ee83-40a7-a7fe-ae0005de08ea/resourceGroups/terraform_import9_test/providers/Microsoft.Network/virtualNetworks/test-nw
   # terraform import azurerm_subnet.defaultsubnet /subscriptions/ed960394-ee83-40a7-a7fe-ae0005de08ea/resourceGroups/terraform_import9_test/providers/Microsoft.Network/virtualNetworks/test-nw/subnets/default

