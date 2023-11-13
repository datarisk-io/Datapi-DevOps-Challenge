variable "resource_group_location" {
  type        = string
  default     = "East US"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "datapi"
  description = "Prefix name for resources."
}