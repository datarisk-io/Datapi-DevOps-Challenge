variable "vm_name" {
  description = "Name of the virtual machine"
  default     = "vm-linux01"
  type        = string
  nullable = false
}

variable "admin_username" {
  description = "Username of the administrator"
  default     = "datarisk-admin"
  type        = string
  nullable = false
  
}

variable "admin_ssh_key_path" {
  description = "Path to the administrator's SSH public key"
  default     = ".ssh/admin-vm01.pub"
  type        = string
  nullable = false
}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_B2ms"
  type        = string
  nullable = false
}

variable "os_disk_storage_account_type" {
  description = "Storage account type for the OS disk"
  default     = "Standard_LRS"
  type        = string
  nullable = false
}

variable "image_publisher" {
  description = "The publisher of the image"
  default     = "Canonical"
  type        = string
  nullable = false
}

variable "image_offer" {
  description = "The offer of the image"
  default     = "0001-com-ubuntu-server-focal"
  type        = string
  nullable = false
}

variable "image_sku" {
  description = "The SKU of the image"
  default     = "20_04-lts"
  type        = string
  nullable = false
}

variable "image_version" {
  description = "The version of the image"
  default     = "latest"
  type        = string
  nullable = false
}

variable "nic_name" {
  description = "Name of the network interface (NIC)"
  default     = "nic-vm-linux01"
  type        = string
  nullable = false
}

variable "public_ip_name" {
  description = "Name of the public IP"
  default     = "ip-vm-linux01"
  type        = string
  nullable = false
}

variable "nsg_name" {
  description = "Name of the Network Security Group (NSG)"
  default     = "nsg-01"
  type        = string
  nullable = false
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "sub-01"
  type        = string
  nullable = false
}

variable "vnet_name" {
  description = "Name of the virtual network (VNet)"
  default     = "vnet-01"
  type        = string
  nullable = false
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "datarisk"
  type        = string
  nullable = false
}

variable "resource_group_location" {
  description = "Location of the resource group"
  default     = "eastus2"
  type        = string
  nullable = false
}
