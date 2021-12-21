output "sql_server_names" {
  value = azurerm_sql_server.sql_server.*.name
}

output "sql_server_login_name" {
  value = azurerm_sql_server.sql_server.*.administrator_login
}

output "sql_server_login_password" {
  value = azurerm_sql_server.sql_server.*.administrator_login_password
}

output "sql_server_domain_name" {
  value = azurerm_sql_server.sql_server.*.fully_qualified_domain_name
}



