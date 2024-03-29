variable "enable" {
  type        = bool
  default     = false
  description = "(required) main switch whether to create the app web service"
}

variable "enable_app_service_plan" {
  type        = bool
  default     = false
  description = "(required) whether to create the app web service plan"
}

variable "app_service_plan_count" {
  type        = number
  default     = 0
  description = "(required) number of create the app web service plan"
}

variable "kinds" {
  type        = list(string)
  description = "(Optional) The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows"
  default     = ["Windows"]
}

variable "enable_app_service" {
  type        = bool
  default     = false
  description = "(required) whether to create the app web service"
}

variable "app_service_count" {
  type        = number
  default     = 0
  description = "(required) number of create the app web service"
}

variable "app_service_plan_names" {
  type        = list(string)
  description = "(required) name of create a web app plan"
}

variable "app_service_names" {
  type        = list(string)
  description = "(required) specifies the name of the app service."
}

variable "app_service_locations" {
  type        = list(string)
  description = "The Azure Regions * where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
}

variable "app_service_plans" {
  description = "A map of sku to apply to web app plan"
  type        = list(map(string))
}

variable "app_settings" {
  description = "A list(map(string)) of app_settings to apply to web app"
  type        = list(map(string))
}

variable "site_config" {
  type = list(object({
    linux_fx_version          = string
    always_on                 = bool
    http2_enabled             = bool
    use_32_bit_worker_process = bool
    number_of_workers         = number
    default_documents         = list(string)
  }))
  default = [{
    linux_fx_version          = ""
    always_on                 = false
    http2_enabled             = false
    use_32_bit_worker_process = true
    number_of_workers         = 1
    default_documents = [
      "Default.htm",
      "Default.html",
      "Default.asp",
      "index.htm",
      "index.html",
      "iisstart.htm",
      "default.aspx",
      "index.php",
    "hostingstart.html"]
  }]

}

variable "connection_string" {
  type = list(object({
    connection_string_name = string,
    connection_type        = string
    connection_value       = string
  }))
  default = [{
    connection_string_name = ""
    connection_type        = ""
    connection_value       = ""
  }]
}

