# resource "azurerm_resource_group" "rg" {
#   name     = "lifehub"
#   location = "centralindia"
#   tags = {
#     Environment = "lifehub terraform resource group"
#     Team = "DevOps"
#   }
# }
#
# resource "azurerm_virtual_network" "vnet" {
#   name                = "myTFVnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = "westus2"
#   resource_group_name = azurerm_resource_group.rg.name
# }
#

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group_name}-vnet"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_cidr]
}

resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "${var.aks_cluster_name}-identity"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.aks_cluster_name}-dns"
  
  kubernetes_version  = "1.33.0"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }
  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  role_based_access_control_enabled = true
  oidc_issuer_enabled               = true

  tags = var.tags
}

# resource "azurerm_key_vault" "kv" {
#   name                        = "${var.resource_group_name}-kv"
#   location                    = var.location
#   resource_group_name         = azurerm_resource_group.rg.name
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   sku_name                    = "standard"
#   purge_protection_enabled    = true
#   soft_delete_retention_days  = 7
#
#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = azurerm_user_assigned_identity.aks_identity.principal_id
#     secret_permissions = ["get", "list"]
#   }
#
#   tags = var.tags
# }

data "azurerm_client_config" "current" {}
