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

resource "azurerm_resource_group" "aks-datarisk" {
  name     = "datarisk-cluster"
  location = "Brazil South"
}