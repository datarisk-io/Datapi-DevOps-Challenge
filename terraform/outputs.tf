output "resource_group_name" {
  value = azurerm_resource_group.vm_rg.name
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "admin_password" {
  sensitive = true
  value     = azurerm_linux_virtual_machine.vm.admin_password
}