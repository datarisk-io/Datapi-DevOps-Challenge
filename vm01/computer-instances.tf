resource "azurerm_linux_virtual_machine" "vm01" {
  name                            = "vm-linux01"
  resource_group_name             = azurerm_resource_group.dkgp.name
  location                        = azurerm_resource_group.dkgp.location
  size                            = "Standard_B2ms"
  admin_username                  = "datarisk-admin"
  network_interface_ids = [
    azurerm_network_interface.vnic01.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  admin_ssh_key {
    username   = "datarisk-admin"
    public_key = file(".ssh/admin-vm01.pub")
  }

os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}