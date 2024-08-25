resource "azurerm_resource_group" "grn" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.grn.location
  resource_group_name = azurerm_resource_group.grn.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.grn.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vnet_name}-nic"
  location            = azurerm_resource_group.grn.location
  resource_group_name = azurerm_resource_group.grn.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "datapi-vm"
  resource_group_name             = azurerm_resource_group.grn.name
  location                        = azurerm_resource_group.grn.location
  size                            = "Standard_F2"
  admin_username                  = var.admin_username
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("../token/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

resource "azurerm_public_ip" "pip" {
  name                = "publicip-pip"
  resource_group_name = azurerm_resource_group.grn.name
  location            = azurerm_resource_group.grn.location
  allocation_method   = "Static"
}
