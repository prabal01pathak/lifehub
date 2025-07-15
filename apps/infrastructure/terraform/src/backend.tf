terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "lhtfstateprod"
    container_name       = "tfstate"
    key                  = "aks-cluster.tfstate"
  }
}
