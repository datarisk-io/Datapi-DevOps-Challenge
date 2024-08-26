output "resource_group_name" {
  description = "Name of resouce group"
  value       = azurerm_resource_group.grn.name
}

output "virtual_network_name" {
  description = "VNET name"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "ID Subnet"
  value       = azurerm_subnet.subnet.id
}

output "vm_public_ip" {
  description = "Public address"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}
