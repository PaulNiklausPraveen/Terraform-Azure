terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.51.0"
    }
  }
}


provider "azurerm" {
  subscription_id = "90d89134-bb66-4a56-b22d-dd169846d147"
  tenant_id       = "cb0b757c-1613-4128-a946-e17aed458518"
  client_id       = "edbd7644-6afb-4031-b34b-7b0d4c82787c"
  client_secret   = "C0Y8Q~dNujWsR.GHWVqu12NixuqPWlBS4KmR-dm2"
  features {}
}
