resource "random_id" "rg_name" {
  prefix      = var.resource_group_name_prefix
  byte_length = 4
}
resource "azurerm_resource_group" "terraform-rg" {
  location = var.resource_group_location
  name     = random_id.rg_name.hex
}
resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}
resource "azurerm_storage_account" "azstorageaccount1" {
  name                     = "${var.azstorageaccount}${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.terraform-rg.name
  location                 = var.resource_group_location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  account_kind             = var.account_kind
}