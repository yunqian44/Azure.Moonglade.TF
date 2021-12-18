output "storageAccountBlobUrl" {
  value = module.moonglade_storage_account.storageAccountBlobUrl
}

output "cdn_endpoint_url" {
  value = module.moonglade_cdn.cdn_endpoint_url
}

# output "password" {
#   value = local.sql_server_administrator_login_password
# }

output "sql_server_name" {
  value = module.moonglade_sql_server.sql_server_names
}

output "sql_database_name" {
  value = module.moonglade_sql_database.sql_database_names
}

output "sql_server_login_name" {
  value = module.moonglade_sql_server.sql_server_login_name
}

output "sql_server_login_password" {
  value       = local.sql_server_administrator_login_password
  description = "The password for logging in to the database."
}

output "sql_server_domain_name" {
  value = module.moonglade_sql_server.sql_server_domain_name
}

output "cnbate_Web_app_ids" {
  value = module.moonglade_web_app.azurerm_app_service_ids
}

output "cnbate_Web_app_names" {
  value = module.moonglade_web_app.azurerm_app_service_names
}

output "cnbate_Web_app_urls" {
  value = module.moonglade_web_app.default_site_hostname
}
