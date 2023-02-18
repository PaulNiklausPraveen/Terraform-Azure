resource "random_id" "rg_name" {
  prefix = var.resource_group_name_prefix
    byte_length = 4
}
resource "azurerm_resource_group" "terraform-rg" {
  location = var.resource_group_location
  name     = "${random_id.rg_name.hex}"
}