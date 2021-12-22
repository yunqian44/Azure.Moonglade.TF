terraform {
  backend "azurerm" {
    storage_account_name = "cnbateterraformstorage1"
    container_name       = "terraform-state"
    key                  = "moonglande.terraform.stats"
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
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

resource "random_string" "password" {
  length           = 16
  min_numeric      = 4
  min_special      = 2
  min_upper        = 2
  min_lower        = 8
  number           = true
  lower            = true
  upper            = true
  special          = true
  override_special = "$%@#"
}

locals {
  resource_group_name                     = replace(var.resource_group_name, "[suffix]", random_string.random_prefix.id)
  storage_account_name                    = replace(var.storage_account_name, "[suffix]", random_string.random_prefix.id)
  storage_account_container_name          = replace(var.storage_account_container_name, "[suffix]", random_string.random_prefix.id)
  cdn_profile_name                        = replace(var.cdn_profile_name, "[suffix]", random_string.random_prefix.id)
  cdn_endpoint_name                       = replace(var.cdn_endpoint_name, "[suffix]", random_string.random_prefix.id)
  app_service_plan_name                   = replace(var.app_service_plan_name, "[suffix]", random_string.random_prefix.id)
  app_service_name                        = replace(var.app_service_name, "[suffix]", random_string.random_prefix.id)
  sql_server_name                         = replace(var.sql_server_name, "[suffix]", random_string.random_prefix.id)
  sql_database_name                       = replace(var.sql_database_name, "[suffix]", random_string.random_prefix.id)
  sql_server_administrator_login          = replace(var.sql_server_administrator_login, "[suffix]", random_string.random_prefix.id)
  sql_server_administrator_login_password = replace(var.sql_server_administrator_login_password, "[suffix]", random_string.password.result)
  sql_server_firewall_rule_name           = replace(var.sql_server_firewall_rule_name, "[suffix]", "")

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

module "moonglade_cdn" {
  source                       = "../module/cdn"
  resource_group_name          = data.azurerm_resource_group.moonglade_resource_group.name
  location                     = data.azurerm_resource_group.moonglade_resource_group.location
  cdn_profile_name             = local.cdn_profile_name
  cdn_profile_sku              = var.cdn_profile_sku
  cdn_endpoint_name            = local.cdn_endpoint_name
  cdn_endpoint_origin_name     = var.cdn_endpoint_origin_name
  is_compression_enabled       = true
  cdn_endpoint_origin_hostname = module.moonglade_storage_account.storageAccountBlobUrl[0]
}


module "moonglade_web_app" {
  source                = "../module/web_app"
  app_service_locations = [data.azurerm_resource_group.moonglade_resource_group.location]
  resource_group_name   = data.azurerm_resource_group.moonglade_resource_group.name

  enable                  = var.enable
  enable_app_service_plan = var.enable_app_service_plan
  app_service_plan_count  = var.app_service_plan_count
  app_service_plan_names  = [local.app_service_plan_name]
  app_service_plans       = var.app_service_plans
  kinds                   = var.kinds

  enable_app_service = var.enable_app_service
  app_service_count  = var.app_service_count
  app_service_names  = [local.app_service_name]
  app_settings = [merge(var.app_setting,
    {
      "ImageStorage__AzureStorageSettings__ContainerName" = local.storage_account_container_name
      }, {
      "ImageStorage__AzureStorageSettings__ConnectionString" = module.moonglade_storage_account.connection_string[0]
      }, {
      "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = false
      }, {
      "WEBSITES_PORT" = 80
      }, {
      "PORT" = 80
  })]
  site_config = var.site_config


  connection_string = [{
    connection_string_name = "MoongladeDatabase"
    connection_type        = "SQLAzure"
    connection_value       = formatlist("Server=tcp:%s.database.windows.net,1433;Database=%s;User ID=%s;Password=%s;Encrypt=True;Connection Timeout=30;", module.moonglade_sql_server.sql_server_names, module.moonglade_sql_server.sql_server_names, module.moonglade_sql_server.sql_server_login_name, local.sql_server_administrator_login_password)[0]
  }]
}

module "moonglade_sql_server" {
  source                                   = "../module/azure_sql/sql_server"
  enable_sql_server                        = true
  sql_server_count                         = 1
  sql_server_names                         = [local.sql_server_name]
  resource_group_name                      = data.azurerm_resource_group.moonglade_resource_group.name
  location                                 = data.azurerm_resource_group.moonglade_resource_group.location
  sql_server_versions                      = var.sql_server_versions
  sql_server_administrator_logins          = [local.sql_server_administrator_login]
  sql_server_administrator_login_passwords = [local.sql_server_administrator_login_password]

  enable_sql_server_firewall_rule = true
  sql_server_firewall_rule_count  = 1
  sql_server_firewall_rule_names  = [local.sql_server_firewall_rule_name]
  start_ip_address                = var.start_ip_address
  end_ip_address                  = var.end_ip_address
}

module "moonglade_sql_database" {
  source                      = "../module/azure_sql/sql_database"
  enable_sql_database         = true
  sql_database_count          = 1
  location                    = data.azurerm_resource_group.moonglade_resource_group.location
  resource_group_name         = data.azurerm_resource_group.moonglade_resource_group.name
  sql_server_names            = module.moonglade_sql_server.sql_server_names
  sql_database_names          = [local.sql_database_name]
  create_models               = var.create_models
  sql_database_editions       = var.sql_database_editions
  sql_database_max_size_bytes = var.sql_database_max_size_bytes
}



