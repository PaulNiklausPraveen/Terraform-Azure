resource "random_id" "rg_name" {
  prefix      = var.resource_group_name_prefix
  byte_length = 4
}
resource "azurerm_resource_group" "terraform-rg" {
  location = var.resource_group_location
  name     = random_id.rg_name.hex
}
resource "azurerm_virtual_network" "network1" {
  name                = var.vnetname
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.terraform-rg.name
  address_space       = var.address_space
  depends_on = [
    azurerm_resource_group.terraform-rg
  ]

  subnet {
    name           = "subnetA"
    address_prefix = var.subnetA
  }

  subnet {
    name           = "subnetB"
    address_prefix = var.subnetB
  }
}

