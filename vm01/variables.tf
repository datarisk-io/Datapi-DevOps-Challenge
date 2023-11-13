variable "vm_name" {
  description = "Nome da máquina virtual"
  default     = "vm-linux01"
  type        = string
}

variable "admin_username" {
  description = "Nome de usuário do administrador"
  default     = "datarisk-admin"
  type        = string
}

variable "admin_ssh_key_path" {
  description = "Caminho para a chave pública SSH do administrador"
  default     = ".ssh/admin-vm01.pub"
  type        = string
}

variable "vm_size" {
  description = "Tamanho da máquina virtual"
  default     = "Standard_B2ms"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "Tipo de conta de armazenamento para o disco do sistema operacional"
  default     = "Standard_LRS"
  type        = string
}

variable "image_publisher" {
  description = "O editor da imagem"
  default     = "Canonical"
  type        = string
}

variable "image_offer" {
  description = "A oferta da imagem"
  default     = "0001-com-ubuntu-server-focal"
  type        = string
}

variable "image_sku" {
  description = "A SKU da imagem"
  default     = "20_04-lts"
  type        = string
}

variable "image_version" {
  description = "A versão da imagem"
  default     = "latest"
  type        = string
}

variable "nic_name" {
  description = "Nome da interface de rede (NIC)"
  default     = "nic-vm-linux01"
  type        = string
}

variable "public_ip_name" {
  description = "Nome do IP público"
  default     = "ip-vm-linux01"
  type        = string
}

variable "nsg_name" {
  description = "Nome do Grupo de Segurança de Rede (NSG)"
  default     = "nsg-01"
  type        = string
}

variable "subnet_name" {
  description = "Nome da subnet"
  default     = "sub-01"
  type        = string
}

variable "vnet_name" {
  description = "Nome da rede virtual (VNet)"
  default     = "vnet-01"
  type        = string
}

variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  default     = "datarisk"
  type        = string
}

variable "resource_group_location" {
  description = "Localização do grupo de recursos"
  default     = "eastus2"
  type        = string
}
