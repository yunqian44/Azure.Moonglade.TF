########################## backend start #########################
# variable "storage_account_name" {
#   type        = string
#   default     = "cnbateterraformstorage"
#   description = "(required)The Azure Storage Account Name of the terraform remote Storage"
# }

# variable "container_name" {
#   type        = string
#   default     = "terraform-state"
#   description = "(required)The Container Name for the terraform remote storage status file"
# }

# variable "key" {
#   type        = string
#   default     = "cnbate.terraform.stats"
#   description = "(required)The Container Key Name for terraform the remote storage status file"
# }
########################## backend end #########################

########################## resource group start #######################
variable "resource_group_name" {
  type        = string
  default     = "Web_Test_TF_RG"
  description = "(required)The name of the resource group"
}
########################## resource group end #########################

########################## cdn start #########################
variable "cdn_profile_name" {
  type    = string
  default = "moongladecdn[suffix]"
}

variable "cdn_endpoint_name" {
  type    = string
  default = "moongladecep[suffix]"
}

variable "cdn_profile_sku" {
  default = "Standard_Microsoft"
}

variable "cdn_endpoint_origin_name" {
  default = "moongladecep"
}

########################## cdn end #########################

########################## storage account start #######################

variable "storage_account_name" {
  type    = string
  default = "moongladestorage[suffix]"
}

variable "storage_sku" {
  type = map(list(string))
  default = {
    account_tier             = ["Standard"],
    account_replication_type = ["LRS"]
  }
  description = "(required) sku of create a storage account"
}

variable "allow_blob_public_access" {
  type        = bool
  default     = true
  description = " Allow or disallow public access to all blobs or containers in the storage account. "
}

variable "storage_account_container_name" {
  type    = string
  default = "moongladeimage[suffix]"
}

variable "container_access_types" {
  type    = list(string)
  default = ["container"]
}

########################## storage account end #########################


########################## web service app start #########################
variable "enable" {
  type        = bool
  default     = true
  description = "(required) Whether to create a web app"
}

variable "enable_app_service_plan" {
  type        = bool
  default     = true
  description = "(required) Whether to create a web app plan"
}

variable "app_service_plan_count" {
  type        = number
  default     = 1
  description = "(required) number of create a web app plan"
}

variable "app_service_plan_name" {
  type        = string
  default     = "moongladeplan[suffix]"
  description = "(required) name of create a web app plan"
}

variable "app_service_plans" {
  type = list(map(string))
  default = [
    {
      tier = "Standard",
      size = "S1"
  }]
  description = "(required) sku of create a web app plan"
}

variable "enable_app_service" {
  type        = bool
  default     = true
  description = "(required) Whether to create a web app "
}

variable "app_service_count" {
  type        = number
  default     = 1
  description = "(required) number of create a web app."
}

variable "app_service_name" {
  type        = string
  default     = "moongladeweb[suffix]"
  description = "(required) specifies the name of the app service."
}

variable "app_settings" {
  type = list(map(string))
  default = [
    {
      "ASPNETCORE_ENVIRONMENT" = "Production"
      "Location"               = "East Asia"
    }
  ]
  description = "(Optional) A key-value pair of app settings."
}
########################## web service app end #########################


########################## sql server start #########################

variable "sql_server_versions" {
  type        = list(string)
  default     = ["12.0"]
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
}

variable "administrator_login" {
  default     = "moongladeplan[suffix]"
  description = "(required) login name of SQL Server."
}

variable "sql_server_administrator_login_passwords" {
  default     = "moongladeplan[suffix]"
  description = "(required) login password of SQL Server."
}

