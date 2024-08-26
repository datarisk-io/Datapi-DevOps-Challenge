terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
    resource_provider_registrations = "none"
    features {}

    subscription_id = var.subscription_id
}