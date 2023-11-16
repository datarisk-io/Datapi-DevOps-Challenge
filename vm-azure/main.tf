terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.80.0"
    }
  }
}

# Definindo o provider
provider "azurerm" {
  features {}
}

# Criando o grupo de recursos
resource "azurerm_resource_group" "desafio-datarisk" {
  name     = "datarisk-resources"
  location = "Brazil South"
}

# Crie a rede virtual dentro do grupo de recursos
resource "azurerm_virtual_network" "vnet-datarisk" {
  name                = "datarisk-vnet01"
  location            = azurerm_resource_group.desafio-datarisk.location
  resource_group_name = azurerm_resource_group.desafio-datarisk.name
  address_space       = ["10.233.0.0/16"]
}

# Criando subnet
resource "azurerm_subnet" "subnet-datarisk" {
  name                  = "datarisk-subnet01"
  resource_group_name   = azurerm_resource_group.desafio-datarisk.name
  virtual_network_name  = azurerm_virtual_network.vnet-datarisk.name
  address_prefixes      = ["10.233.1.0/24"]
}

# Criando o Grupo de segurança da rede
resource "azurerm_network_security_group" "nsg-datarisk" {
  name                = "datarisk-nsg01"
  location            = azurerm_resource_group.desafio-datarisk.location
  resource_group_name = azurerm_resource_group.desafio-datarisk.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "10.233.1.0/24"
  }

  # Adicionando regras para permitir tráfego HTTP (porta 80) e HTTPS (porta 443)
  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "10.233.1.0/24"
  }

  security_rule {
    name                       = "Allow-HTTPS"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "10.233.1.0/24"
  }
}

# Associar NSG a subnet
resource "azurerm_subnet_network_security_group_association" "nsg-datarisk" {
  subnet_id                 = azurerm_subnet.subnet-datarisk.id
  network_security_group_id = azurerm_network_security_group.nsg-datarisk.id
}

# Disponibilizar um IP público
resource "azurerm_public_ip" "pip-datarisk" {
  name                = "datarisk-pip01"
  resource_group_name = azurerm_resource_group.desafio-datarisk.name
  location            = azurerm_resource_group.desafio-datarisk.location
  allocation_method   = "Dynamic"
}

# Provisionamento da "placa de rede"
resource "azurerm_network_interface" "nic-datarisk" {
  name                = "datarisk-nic01"
  resource_group_name = azurerm_resource_group.desafio-datarisk.name
  location            = azurerm_resource_group.desafio-datarisk.location

  ip_configuration {
    name                                = "internal"
    subnet_id                           = azurerm_subnet.subnet-datarisk.id
    private_ip_address_allocation       = "Dynamic"
    public_ip_address_id                = azurerm_public_ip.pip-datarisk.id
  }
}

# # Criando o Storage Account
# resource "azurerm_storage_account" "storage-account-datarisk" {
#   name                     = "datarisk-sacc"
#   resource_group_name      = azurerm_resource_group.desafio-datarisk.name
#   location                 = azurerm_resource_group.desafio-datarisk.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# # Criando o container dentro do Storage Account
# resource "azurerm_storage_container" "tfstate_container" {
#   name                  = "datarisk-tfstatecontainer"
#   storage_account_name  = azurerm_storage_account.storage-account-datarisk.name
#   container_access_type = "private"
# }

# # Configurando o backend do Terraform para usar o Azure Storage Account
# terraform {
#   backend "azurerm" {
#     storage_account_name = azurerm_storage_account.storage-account-datarisk.name
#     container_name       = azurerm_storage_container.tfstate_container.name
#     key                  = "terraform.tfstate"
#   }
# }

# Criando a máquina virtual
resource "azurerm_linux_virtual_machine" "vm-datarisk" {
  name                            = "datarisk-vm01"
  resource_group_name             = azurerm_resource_group.desafio-datarisk.name
  location                        = azurerm_resource_group.desafio-datarisk.location
  size                            = "Standard_B2S"
  admin_username                  = "contratado"  # TODO: colocar credenciais num secret dentro de um key-vault 
  admin_password                  = "Dev0ps@2023" # TODO: colocar credenciais num secret dentro de um key-vault
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic-datarisk.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

# Saída para exibir o endereço IP público da máquina virtual
output "public_ip_address" {
  value = azurerm_public_ip.pip-datarisk.ip_address
}
