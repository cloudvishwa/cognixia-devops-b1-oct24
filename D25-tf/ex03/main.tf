provider "azurerm" {
  features {}  
  subscription_id = "b4f0d99c-f4f9-449e-bf16-1b6e253ac5d1"
}

resource "azurerm_resource_group" "rg01" {
  location = var.location
  name = "rg01"
  tags = {
    env = "dev"
    dep = var.tag_dep
    owner = var.tag_owner
    proj = "p1"
  }
}

resource "azurerm_virtual_network" "vnet01" {
  location = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
  name = "Vnet01"
  #address_space = ["10.10.0.0/16"]
  address_space = [var.loc_as[var.location]]
  tags = {
    env = "dev"
    dep = var.tag_dep
    owner = var.tag_owner
    proj = "p1"
  }
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets
  name = each.key
  address_prefixes = each.value
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name = azurerm_resource_group.rg01.name
}