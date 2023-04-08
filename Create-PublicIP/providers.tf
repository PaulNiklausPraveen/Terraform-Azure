terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.51.0"
    }
  }
}


provider "azurerm" {
  subscription_id = "Type Subscription ID"
  tenant_id       = "Type Tenant ID"
  client_id       = "Type Client ID"
  client_secret   = "Type Client Secret Key"
  features {}
}
