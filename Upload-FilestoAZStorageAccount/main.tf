Uterraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.64.0"
    }
  }
}

provider "azurerm"{
  features {}
}

#Create a resource group
resource "azurerm_resource_group" "az-rg-1" {
  name     = "az-rg-1"
  location = "eastus"
}

resource azurerm_storage_account "primary" {
  name                     = "azstgaccount2301"
  resource_group_name      = azurerm_resource_group.az-rg-1.name
  location                 = azurerm_resource_group.az-rg-1.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "container1" {
  name                  = "container1"
  storage_account_name  = azurerm_storage_account.primary.name
  container_access_type = "blob"
}
resource "azurerm_storage_blob" "blob1" {
  for_each = fileset(path.module, "folder_containing_files/*")
 
  name                   = trim(each.key, "folder_containing_file/")
  storage_account_name   = azurerm_storage_account.primary.name
  storage_container_name = azurerm_storage_container.container1.name
  type                   = "Block"
  source                 = each.key
}
