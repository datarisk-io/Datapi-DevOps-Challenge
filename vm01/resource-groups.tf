# criando o grupo dos recursos DATARISK
resource "azurerm_resource_group" "dkgp" {
    name ="datarisk-group"
    location = "eastus2"
}
output "resource_group_dk-gp" {
  value = azurerm_resource_group.dkgp
}