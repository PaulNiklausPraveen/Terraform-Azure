output "resource_group_name" {
  value = azurerm_resource_group.terraform-rg.name
}
output "storageaccount1" {
  value = azurerm_storage_account.azstorageaccount1.name
}
