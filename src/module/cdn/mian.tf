resource "azurerm_cdn_profile" "cdn_profile" {
  name                = "${var.cdn_profile_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "${var.cdn_profile_sku}"
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                = "${azurerm_cdn_profile.cdn_profile.name}"
  profile_name        = "${azurerm_cdn_profile.cdn_profile.name}"
  location            = "${azurerm_cdn_profile.cdn_profile.location}"
  resource_group_name = "${azurerm_cdn_profile.cdn_profile.resource_group_name}"
  origin {
    name      = "${var.cdn_endpoint_origin_name}"
    host_name = "${var.cdn_endpoint_origin_hostname}"
  }
}
