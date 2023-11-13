output "vm01_name" {
  value       = azurerm_linux_virtual_machine.vm01.name
  description = "Nome da VM"
}

output "vm01_size" {
  value       = azurerm_linux_virtual_machine.vm01.size
  description = "Maquina alocada"
}

output "vm01_id" {
  value       = azurerm_linux_virtual_machine.vm01.virtual_machine_id
  description = "Id da Vm01"
}

