output "sql_server_name" {
  value = azurerm_sql_server.sql_server.name
}

output "sql_server_login_name" {
  value = azurerm_sql_server.sql_server.administrator_login
}


output "sql_server_login_password" {
  value = azurerm_sql_server.sql_server.administrator_login_password
}
