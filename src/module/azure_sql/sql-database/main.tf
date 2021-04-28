resource "azurerm_sql_database" "sql_database" {
  name                = var.sql_database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = var.sql_server_name
  create_mode         = "Default"
  edition             = var.sql_database_edition
  max_size_bytes      = var.sql_database_max_size_bytes
}
