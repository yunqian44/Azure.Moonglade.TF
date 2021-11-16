variable "resource_group_name" {
  description = "Specifies the name of the CDN Profile. Changing this forces a new resource to be created."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "cdn_profile_name" {
  description = "Specifies the name of the CDN Profile. Changing this forces a new resource to be created."
}

variable "cdn_profile_sku" {
  description = "The pricing related information of current CDN profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."
}

# variable "cdn_endpoint_name" {
#   description = "Specifies the name of the CDN Endpoint. Changing this forces a new resource to be created."
# }

variable "cdn_endpoint_origin_name" {
  description=" The name of the origin. This is an arbitrary value. However, this value needs to be unique under the endpoint. Changing this forces a new resource to be created."
}

variable "cdn_endpoint_origin_hostname" {
  description="A string that determines the hostname/IP address of the origin server. This string can be a domain name, Storage Account endpoint, Web App endpoint, IPv4 address or IPv6 address. Changing this forces a new resource to be created."
}





