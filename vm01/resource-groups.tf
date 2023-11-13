resource "azurerm_resource_group" "dkgp" {
  name     = var.resource_group_name
  location = var.resource_group_location
}