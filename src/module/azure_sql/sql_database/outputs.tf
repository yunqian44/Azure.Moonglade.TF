output "sql_database_names" {
  value = azurerm_sql_database.sql_database.*.name
}
