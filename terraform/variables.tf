variable "resource_group_name" {
  description = "Name resource group"
  default     = "api-devops-challenge"
  type        = string
}

variable "resource_group_location" {
  description = "Location resource group"
  default     = "eastus"
  type        = string
}

variable "vnet_name" {
  description = "Name virtual network (VNet)"
  default     = "vnet-api-devops-challenge"
  type        = string
}

variable "subnet_name" {
  description = "Name the subnet"
  default     = "subnet-api-devops-challenge"
  type        = string

}

variable "nic_name" {
  description = "Name network interface Card(NIC)"
  default     = "nic-vm-api-devops-challenge"
  type        = string
}

variable "vm_name" {
  description = "Name virtual machine"
  default     = "vm-linux-api-devops-challenge"
  type        = string
}

variable "admin_username" {
  description = "Username admin"
  default     = "devops-admin"
  type        = string
  
}

variable "path_ssh_key" {
  description = "Path administrator's SSH public key"
  default     = "ssh/vm-api-devops-challenge.pub"
  type        = string

}

variable "nsg_name" {
  description = "Name Network Security Group (NSG)"
  default     = "nsg-api-devops-challenge"
  type        = string
}

