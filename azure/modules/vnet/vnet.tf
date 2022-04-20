resource "azurerm_resource_group" "aks-ea" {
  name     = "aks-resource-group"
  location = var.location
}

resource "azurerm_virtual_network" "aks-vnet" {
  name                = "aks-vnet"
  location            = azurerm_resource_group.aks-ea.location
  resource_group_name = azurerm_resource_group.aks-ea.name
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "aks-subnet-1" {
  name                 = "aks-subnet-public1"
  resource_group_name  = azurerm_resource_group.aks-ea.name
  address_prefix     = "192.168.1.0/24"
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_subnet" "aks-subnet-2" {
  name                 = "aks-subnet-public2"
  resource_group_name  = azurerm_resource_group.aks-ea.name
  address_prefix     = "192.168.2.0/24"
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_subnet" "aks-subnet-3" {
  name                 = "aks-subnet-private1"
  resource_group_name  = azurerm_resource_group.aks-ea.name
  address_prefix     = "192.168.3.0/24"
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_subnet" "aks-subnet-4" {
  name                 = "aks-subnet-private2"
  resource_group_name  = azurerm_resource_group.aks-ea.name
  address_prefix     = "192.168.4.0/24"
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  service_endpoints    = ["Microsoft.Sql"]
}
