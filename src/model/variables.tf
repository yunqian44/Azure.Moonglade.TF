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

variable "kinds" {
  type        = list(string)
  default     = ["Linux"]
  description = " (Optional) The kind of the App Service Plan to create. "
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

variable "app_setting" {
  type = map(any)
  default = {
    "ImageStorage__Provider" = "azurestorage"
  }
  description = "(Optional) A key-value pair of app settings."
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
    linux_fx_version          = "DOCKER|ediwang/moonglade"
    always_on                 = true
    http2_enabled             = true
    use_32_bit_worker_process = false
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
########################## web service app end #########################

########################## sql database start #########################

variable "sql_database_name" {
  type        = string
  default     = "moongladedb[suffix]"
  description = "(required) name of create sql server."
}

variable "sql_database_editions" {
  type        = list(string)
  default     = ["Standard"]
  description = " (Optional) The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web. "
}

variable "sql_database_max_size_bytes" {
  type        = list(number)
  default     = [null]
  description = "(Optional) The maximum size that the database can grow to. Applies only if create_mode is Default"
}

variable "create_models" {
  type        = list(string)
  default     = ["Default"]
  description = " (Optional) Specifies how to create the database. Valid values are: Default, Copy, OnlineSecondary, NonReadableSecondary, PointInTimeRestore, Recovery, Restore or RestoreLongTermRetentionBackup. Must be Default to create a new database. Defaults to Default."
}

########################## sql database end #########################


########################## sql server start #########################
variable "sql_server_name" {
  type        = string
  default     = "moongladesql[suffix]"
  description = "(required) name of create sql server."
}

variable "sql_server_versions" {
  type        = list(string)
  default     = ["12.0"]
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
}

variable "sql_server_administrator_login" {
  default     = "moonglade"
  description = "(required) login name of SQL Server."
}

variable "sql_server_administrator_login_password" {
  default     = "[suffix]"
  description = "(required) login password of SQL Server."
}

variable "sql_server_firewall_rule_name" {
  type        = string
  default     = "AllowAllIps "
  description = "(Required) The name of the firewall rule."
}

variable "start_ip_address" {
  type        = list(string)
  default     = ["0.0.0.0"]
  description = "(Required) The starting IP address to allow through the firewall for this rule."
}

variable "end_ip_address" {
  type        = list(string)
  default     = ["0.0.0.0"]
  description = "(Required) The ending IP address to allow through the firewall for this rule."
}

