terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-westeurope"
    storage_account_name = "csb10032001f9f70371"
    container_name       = "backend"
    key                  = "dev.terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}
