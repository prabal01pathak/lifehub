terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name   = "tfstate-rg"
  location = "centralindia"
  tags = {
    Environment = "tfstate resource group"
    Team = "DevOps"
  }
}

resource "azurerm_storage_account" "sa" {
  name = "lhtfstateprod"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Environment = "Terraform State"
    Team = "DevOps"
  }
}
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
