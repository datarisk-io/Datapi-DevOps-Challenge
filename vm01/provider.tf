terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
  backend "remote" {
    organization = "lucasbahr12"
    workspaces {
      name = "datarisk"
    }
  }
}


provider "azurerm" {
  features {}
}