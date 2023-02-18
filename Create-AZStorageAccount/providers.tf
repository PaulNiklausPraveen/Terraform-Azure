# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.44.1"
    }
  }
}

#Register an application in Azure AD and update the below data
provider "azurerm" {
  subscription_id = "xpA8Q~9-e9c24a3-abcde0-4ce8-a11c-d448487f1"
  client_id       = "xpA8Q~9-e9c24a3-abcde0-4ce8-a11c-d448487f1"
  client_secret   = "xpA8Q~9-e9c24a3-abcde0-4ce8-a11c-d448487f1"
  tenant_id       = "xpA8Q~9-e9c24a3-abcde0-4ce8-a11c-d448487f1"
  features {}
}
