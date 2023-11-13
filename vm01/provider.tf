terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
    backend "azurerm" {
      resource_group_name  = var.resource_group_name
      storage_account_name = var.storage_name
      container_name       = var.storage_name
      key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}