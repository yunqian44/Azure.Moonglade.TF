resource "azurerm_storage_account" "storageAccount" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type


  dynamic "static_website" {
    for_each = var.static_website.index_document != "" ? ["static web site"] : []

    content {
      index_document     = var.static_website.index_document
      error_404_document = var.static_website.error_document
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules.default_action != "" ? ["network rules"] : []

    content {
      default_action             = var.network_rules.default_action
      bypass                     = var.network_rules.bypass
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.virtual_network_subnet_ids
    }
  }
}
