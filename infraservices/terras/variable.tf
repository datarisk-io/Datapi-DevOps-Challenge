variable "resource_group_name" {
  default     = "data-chal-grn"
  type        = string
}

variable "location" {
  default     = "West US"
  type        = string
}

variable "vnet_name" {
  default     = "data-chal-vnet"
  type        = string
}

variable "subnet_name" {
  default     = "data-chal-subnet"
  type        = string
}

variable "admin_username" {
  default     = "datauser"
  type        = string
}
