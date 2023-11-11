resource "azurerm_linux_virtual_machine" "vm01" {
  name                            = var.vm_name
  resource_group_name             = azurerm_resource_group.dkgp.name
  location                        = azurerm_resource_group.dkgp.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.vnic01.id,
  ]

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.admin_ssh_key_path)
  }

os_disk {
    storage_account_type = var.os_disk_storage_account_type
    caching              = "ReadWrite"
  }
}