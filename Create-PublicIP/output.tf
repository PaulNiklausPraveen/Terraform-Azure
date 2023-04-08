output "resource_group_name1"{
value = azurerm_resource_group.resourcegroup1.name
}
 output "virtualnetwork"{
    value = azurerm_virtual_network.vnet1.name
}
 output "virtualnetwork_AddressSPace" {
value = azurerm_virtual_network.vnet1.address_space
}
output  "publicip1"{
 value =azurerm_public_ip.publicip1.ip_address
}
