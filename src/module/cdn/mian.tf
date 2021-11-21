resource "azurerm_cdn_profile" "cdn_profile" {
  name                = var.cdn_profile_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.cdn_profile_sku
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                      = var.cdn_endpoint_name
  profile_name              = azurerm_cdn_profile.cdn_profile.name
  location                  = azurerm_cdn_profile.cdn_profile.location
  resource_group_name       = azurerm_cdn_profile.cdn_profile.resource_group_name
  is_compression_enabled    = var.is_compression_enabled
  content_types_to_compress = var.content_types_to_compress
  origin {
    name      = var.cdn_endpoint_origin_name
    host_name = var.cdn_endpoint_origin_hostname
  }
}
