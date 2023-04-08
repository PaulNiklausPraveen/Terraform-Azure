
resource "azurerm_resource_group" "resourcegroup1" {
  name     = var.resourcegroup1
  location = var.location1
}

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1.name
  location            = var.location1
  resource_group_name = var.resourcegroup1
  address_space       = [var.vnet1.address_space]

  depends_on = [
    azurerm_resource_group.resourcegroup1
  ]
}

resource "azurerm_subnet" "subnetA" {
  name                 = var.subneta.name
  resource_group_name  = var.resourcegroup1
  virtual_network_name = var.vnet1.name
  address_prefixes     = [var.subneta.address_space]
  depends_on = [
    azurerm_virtual_network.vnet1
  ]
}

resource "azurerm_subnet" "subnetB" {
  name                 = var.subnetb.name
  resource_group_name  = var.resourcegroup1
  virtual_network_name = var.vnet1.name
  address_prefixes     = [var.subnetb.address_space]
  depends_on = [
    azurerm_virtual_network.vnet1
  ]
}

resource "azurerm_network_interface" "publicinterface" {
  name                = var.interface1
  location            = var.location1
  resource_group_name = var.resourcegroup1

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip1.id
  }
  depends_on = [
    azurerm_subnet.subnetA
  ]
}

resource "azurerm_public_ip" "publicip1" {
  name                = var.publicip1name
  resource_group_name = var.resourcegroup1
  location            = var.location1
  allocation_method   = "Static"
  depends_on = [
    azurerm_resource_group.resourcegroup1
  ]
}
