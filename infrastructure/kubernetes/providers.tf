terraform {
  required_version = ">=1.0"

  backend "azurerm" {
    resource_group_name  = "rpaazure-dev-tfstate"
    storage_account_name = "rpaazuredevaccount"
    container_name       = "rpaazure-dev-container"
    key                  = "rpaazure-dev-kubernetes-tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.5.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.ARM_SUBSCRIPTION_ID
  tenant_id       = var.ARM_TENANT_ID
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
