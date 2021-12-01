output "sql_server_names" {
  value = azurerm_sql_server.sql_server.*.name
}
