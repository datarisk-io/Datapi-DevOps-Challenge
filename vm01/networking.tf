# criando VNET
resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet-01"
  location            = azurerm_resource_group.dkgp.location
  resource_group_name = azurerm_resource_group.dkgp.name
  address_space       = ["10.0.0.0/16"]

}

# criando Subnet
resource "azurerm_subnet" "sub01" {
  name                 = "sub-01"
  resource_group_name  = azurerm_resource_group.dkgp.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.1.0/24"]

}


# criando grupo de seguranca com liberacao da porta 8085 na entrada
resource "azurerm_network_security_group" "nsg01" {
  name                = "nsg-01"
  location            = azurerm_resource_group.dkgp.location
  resource_group_name = azurerm_resource_group.dkgp.name

   security_rule {
    name                       = "Allow-RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.1.0/24"
  }
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

# Associar grupo de seguranca ao Subnet
resource "azurerm_subnet_network_security_group_association" "nsg01" {
  subnet_id                 = azurerm_subnet.sub01.id
  network_security_group_id = azurerm_network_security_group.nsg01.id
}

# criar endereco de ip publico
resource "azurerm_public_ip" "puip01" {
  name                = "ip-vm-linux01"
  resource_group_name = azurerm_resource_group.dkgp.name
  location            = azurerm_resource_group.dkgp.location
  allocation_method   = "Static"

}

# criando NIC
resource "azurerm_network_interface" "vnic01" {
  name                = "nic-vm-linux01"
  resource_group_name = azurerm_resource_group.dkgp.name
  location            = azurerm_resource_group.dkgp.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sub01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.puip01.id
  }

}