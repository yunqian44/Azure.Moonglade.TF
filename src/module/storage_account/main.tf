resource "azurerm_storage_account" "storageAccount" {
  count                    = var.enable_storage_account && var.storage_account_count > 0 ? var.storage_account_count : 0
  name                     = element(var.storage_account_names,count.index)
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = element(var.account_tiers,count.index)
  account_replication_type = element(var.account_replication_types,count.index)
  allow_blob_public_access = var.allow_blob_public_access 

  dynamic "static_website" {
    for_each = element(var.static_website_index_document, count.index) != "" ? ["static web site"] : []

    content {
      index_document     = element(var.static_website_index_document, count.index)
      error_404_document = element(var.static_website_error_404_document, count.index)
    }
  }

  dynamic "network_rules" { 
    for_each = element(var.network_rules_default_action, count.index) != "" ? ["network rules"] : []

    content {
      default_action             = element(var.network_rules_default_action, count.index)
      bypass                     = element(var.network_rules_bypass, count.index)
      ip_rules                   = element(var.network_rules_ip_rules, count.index)
      virtual_network_subnet_ids = element(var.network_rules_virtual_network_subnet_ids, count.index)
    }
  }
}


resource "azurerm_storage_container" "storageContainer" {
  count                 = var.enable_storage_container && var.enable_storage_account && var.storage_container_count > 0 ? var.storage_container_count : 0
  name                  = element(var.storage_account_container_names, count.index) 
  storage_account_name  = element(azurerm_storage_account.storageAccount.*.name,count.index)
  container_access_type = element(var.container_access_types, count.index) 
}