terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
    backend "azurerm" {
      resource_group_name  = "datarisk-group"
      storage_account_name = "datariskstrg"
      container_name       = "tfstatedatarisk"
      key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  use_oidc = true
  features {}
}