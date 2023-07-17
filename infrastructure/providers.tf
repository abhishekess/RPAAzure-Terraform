terraform {
  required_version = ">=1.0"

  backend "azurerm" {
    resource_group_name  = "rpaazure-dev-tfstate"
    storage_account_name = "rpaazuredevaccount"
    container_name       = "rpaazure-dev-container"
    key                  = "rpaazure-dev-infrastructure-tfstate"
  }

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.ARM_SUBSCRIPTION_ID
  tenant_id       = var.ARM_TENANT_ID
}