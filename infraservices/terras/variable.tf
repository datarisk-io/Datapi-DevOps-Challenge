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

variable "subscription_id" {
  default = "44060d5b-e2df-40c6-bfae-8ad6e8fc4f2e"
  type = string
}
