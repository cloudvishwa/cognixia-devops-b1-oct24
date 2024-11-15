provider "azurerm" {
  features {}  
  subscription_id = "b4f0d99c-f4f9-449e-bf16-1b6e253ac5d1"
}

resource "azurerm_resource_group" "rg01" {
  location = "East US"
  name = "rg01"
  tags = {
    env = "dev"
    dep = "finance"
    owner = "Vishwa"
    proj = "p1"
  }
}

resource "azurerm_virtual_network" "vnet01" {
  location = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
  name = "Vnet01"
  address_space = ["10.10.0.0/16"]
  tags = {
    env = "dev"
    dep = "finance"
    owner = "Vishwa"
    proj = "p1"
  }
}