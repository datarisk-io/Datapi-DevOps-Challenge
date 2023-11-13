# main.tf

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "api-devops-challenge" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "vnet-api-devops-challenge" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.api-devops-challenge.location
  resource_group_name = azurerm_resource_group.api-devops-challenge.name
}

resource "azurerm_subnet" "subnet-api-devops-challenge" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.api-devops-challenge.name
  virtual_network_name = azurerm_virtual_network.vnet-api-devops-challenge.name
  address_prefixes    = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg-api-devops-challenge" {
  name                = var.nsg_name
  location            = azurerm_resource_group.api-devops-challenge.location
  resource_group_name = azurerm_resource_group.api-devops-challenge.name

  security_rule {
    name                       = "SSH"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.1.0/24"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet-nsg-association" {
  subnet_id                 = azurerm_subnet.subnet-api-devops-challenge.id
  network_security_group_id = azurerm_network_security_group.nsg-api-devops-challenge.id
}

resource "azurerm_network_interface" "nic-api-devops-challenge" {
  name                = var.nic_name
  location            = azurerm_resource_group.api-devops-challenge.location
  resource_group_name = azurerm_resource_group.api-devops-challenge.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-api-devops-challenge.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-linux-api-devops-challenge" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.api-devops-challenge.name
  location            = azurerm_resource_group.api-devops-challenge.location
  size                = "Standard_B1s" # This size is within the free tier limits
  admin_username      = var.admin_username

  network_interface_ids = [azurerm_network_interface.nic-api-devops-challenge.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.path_ssh_key)
  }

}
