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

    subscription_id="5b601c77-6e94-4801-9eba-eabdc4524501"
}