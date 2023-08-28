terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }
}

provider "azurerm" {
  features{}
  subscription_id = var.azSubscriptionId
  client_id = var.azClientId
  client_secret = var.azClientSecret
  tenant_id = var.azTenantId
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg.name
  location = var.rg.location
} 

# Azure Storage account
resource "azurerm_storage_account" "sa" {
  name                     = var.sa.name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.sa.accTier
  account_replication_type = var.sa.accReplication
}