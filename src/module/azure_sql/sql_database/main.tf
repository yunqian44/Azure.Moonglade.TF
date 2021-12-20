resource "azurerm_sql_database" "sql_database" {
  count                            = var.enable_sql_database && var.sql_database_count > 0 ? var.sql_database_count : 0
  name                             = element(var.sql_database_names, count.index)
  resource_group_name              = var.resource_group_name
  location                         = var.location
  server_name                      = element(var.sql_server_names, count.index)
  create_mode                      = element(var.create_models, count.index) //"Default"
  edition                          = element(var.sql_database_editions, count.index)
  max_size_bytes                   = element(var.sql_database_max_size_bytes, count.index)
  requested_service_objective_name = element(var.requested_service_objective_names, count.index)
}
