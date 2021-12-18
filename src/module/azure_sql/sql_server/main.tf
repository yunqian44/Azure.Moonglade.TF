resource "azurerm_sql_server" "sql_server" {
  count                        = var.enable_sql_server && var.sql_server_count > 0 ? var.sql_server_count : 0
  name                         = element(var.sql_server_names, count.index)
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = element(var.sql_server_versions, count.index) //"12.0"
  administrator_login          = element(var.sql_server_administrator_logins, count.index)
  administrator_login_password = element(var.sql_server_administrator_login_passwords, count.index)
}

resource "azurerm_sql_firewall_rule" "sql_server_firewall_rule" {
  count               = var.enable_sql_server_firewall_rule && var.sql_server_firewall_rule_count > 0 ? var.sql_server_firewall_rule_count : 0
  name                = element(var.sql_server_firewall_rule_names, count.index)
  resource_group_name = var.resource_group_name
  server_name         = element(azurerm_sql_server.example.*.name, count.index)
  start_ip_address    = element(var.start_ip_address, count.index)
  end_ip_address      = element(var.end_ip_address, count.index)
}
