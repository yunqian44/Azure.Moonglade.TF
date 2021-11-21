variable "resource_group_name" {
  type        = string
  description = "Specifies the name of the CDN Profile. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "cdn_profile_name" {
  type        = string
  description = "Specifies the name of the CDN Profile. Changing this forces a new resource to be created."
}

variable "cdn_endpoint_name" {
  type        = string
  description = "Specifies the name of the CDN EndPoint. Changing this forces a new resource to be created."
}

variable "cdn_profile_sku" {
  type        = string
  description = "The pricing related information of current CDN profile. Accepted values are Standard_Akamai, Standard_ChinaCdn, Standard_Microsoft, Standard_Verizon or Premium_Verizon."
}

variable "is_compression_enabled" {
  type        = bool
  default     = false
  description = "The pricing related inf"
}

variable "cdn_endpoint_origin_name" {
  type        = string
  description = " The name of the origin. This is an arbitrary value. However, this value needs to be unique under the endpoint. Changing this forces a new resource to be created."
}

variable "cdn_endpoint_origin_hostname" {
  type        = string
  description = "A string that determines the hostname/IP address of the origin server. This string can be a domain name, Storage Account endpoint, Web App endpoint, IPv4 address or IPv6 address. Changing this forces a new resource to be created."
}

variable "content_types_to_compress" {
  type        = list(string)
  default     = ["application/eot", "application/font", "application/font-sfnt", "application/javascript"]
  description = " (Optional) An array of strings that indicates a content types on which compression will be applied. The value for the elements should be MIME types."
}




