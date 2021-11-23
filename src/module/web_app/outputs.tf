output "app_service_plan_ids" {
  value = azurerm_app_service_plan.service_plan.*.id
}

output "azurerm_app_service_ids" {
  value = azurerm_app_service.web_service.*.id
}

output "azurerm_app_service_names" {
  value = azurerm_app_service.web_service.*.name
}
