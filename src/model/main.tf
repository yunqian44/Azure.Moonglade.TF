terraform {
  backend "azurerm" {
    storage_account_name = "cnbateterraformstorage1"
    container_name       = "terraform-state"
    key                  = "moonglande.terraform.stats"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.67.0"
    }
  }
}


provider "azurerm" {
  features {}
}

resource "random_string" "random_prefix" {
  length  = 4
  upper   = false
  special = false
}

locals {
  resource_group_name            = replace(var.resource_group_name, "[suffix]", random_string.random_prefix.id)
  storage_account_name           = replace(var.storage_account_name, "[suffix]", random_string.random_prefix.id)
  storage_account_container_name = replace(var.storage_account_container_name, "[suffix]", random_string.random_prefix.id)
  cdn_profile_name               = replace(var.cdn_profile_name, "[suffix]", random_string.random_prefix.id)
}

data "azurerm_resource_group" "moonglade_resource_group" {
  name = var.resource_group_name
}

module "moonglade_storage_account" {
  source                    = "../module/storage_account"
  resource_group_name       = data.azurerm_resource_group.moonglade_resource_group.name
  location                  = data.azurerm_resource_group.moonglade_resource_group.location
  enable_storage_account    = true
  storage_account_count     = 1
  allow_blob_public_access  = var.allow_blob_public_access
  storage_account_names     = [local.storage_account_name]
  account_tiers             = lookup(var.storage_sku, "account_tier")
  account_replication_types = lookup(var.storage_sku, "account_replication_type")

  enable_storage_container        = true
  storage_container_count         = 1
  storage_account_container_names = [local.storage_account_container_name]
  container_access_types          = var.container_access_types
}

# module "moonglade_cdn" {
#   source                       = "../module/cdn"
#   resource_group_name          = data.azurerm_resource_group.moonglade_resource_group.name
#   location                     = data.azurerm_resource_group.moonglade_resource_group.location
#   cdn_profile_name             = local.cdn_profile_name
#   cdn_profile_sku              = var.cdn_profile_sku
#   cdn_endpoint_origin_name     = var.ec_cdn_endpoint_origin_name
#   cdn_endpoint_origin_hostname = module.moonglade_storage_account.storageaccountbloburl
# }



# module "moonglade_Web_app" {
#   source                = "../module/web_app"
#   app_service_locations = [local.location_eastAsia, local.location_southeastAsia]
#   resource_group_name   = data.azurerm_resource_group.cnbate_resource_group.name

#   enable                  = var.enable
#   enable_app_service_plan = var.enable_app_service_plan
#   app_service_plan_count  = var.app_service_plan_count
#   app_service_plan_names  = var.app_service_plan_names
#   app_service_plans       = var.app_service_plans

#   enable_app_service = var.enable_app_service
#   app_service_count  = var.app_service_count
#   app_service_names  = var.app_service_names
#   app_settings       = var.app_settings
# }
