resource "azurerm_app_service_plan" "service_plan" {
  count               = var.enable && var.enable_app_service_plan && var.app_service_plan_count > 0 ? var.app_service_plan_count : 0
  name                = element(var.app_service_plan_names, count.index)
  location            = element(var.app_service_locations, count.index)
  resource_group_name = var.resource_group_name
  kind                = element(var.kinds, count.index)
  reserved            = element(var.kinds, count.index) == "Linux" ? true : false


  sku {
    tier = lookup(element(var.app_service_plans, count.index), "tier")
    size = lookup(element(var.app_service_plans, count.index), "size")
  }
}

resource "azurerm_app_service" "web_service" {
  count               = var.enable && var.enable_app_service_plan && var.enable_app_service && var.app_service_count > 0 ? var.app_service_count : 0
  name                = element(var.app_service_names, count.index)
  location            = element(var.app_service_locations, count.index)
  resource_group_name = var.resource_group_name
  app_service_plan_id = element(azurerm_app_service_plan.service_plan.*.id, count.index)
  app_settings        = element(var.app_settings, count.index)

  # Configure Docker Image to load on start
  dynamic "site_config" {
    for_each = lookup(element(var.site_config, count.index), "linux_fx_version") != "" ? ["site_config"] : []

    content {
      linux_fx_version          = lookup(element(var.site_config, count.index), "linux_fx_version")
      always_on                 = lookup(element(var.site_config, count.index), "always_on")
      http2_enabled             = lookup(element(var.site_config, count.index), "http2_enabled")
      use_32_bit_worker_process = lookup(element(var.site_config, count.index), "use_32_bit_worker_process")
      default_documents         = lookup(element(var.site_config, count.index), "default_documents")
      number_of_workers         = lookup(element(var.site_config, count.index), "number_of_workers")
    }
  }

  dynamic "connection_string" {
    for_each = lookup(element(var.connection_string, count.index), "connection_string_name") != "" ? ["connection_string"] : []

    content {
      name  = lookup(element(var.connection_string, count.index), "connection_string_name") //"Database"
      type  = lookup(element(var.connection_string, count.index), "connection_type")        //"SQLServer"
      value = lookup(element(var.connection_string, count.index), "connection_value")       //"Server=some-server.mydomain.com;Integrated Security=SSPI"
    }
  }

}
