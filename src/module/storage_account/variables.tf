variable "enable_storage_account" {
  type        = bool
  default     = false
  description = "(required) main switch whether to create the storage account"
}

variable "storage_account_count" {
  type        = number
  default     = 0
  description = "(required) number of create the storage account."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account. Changing this forces a new resource to be created"
}

variable "storage_account_names" {
  type        = list(string)
  description = "Specifies the names of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "account_tiers" {
  type        = list(string)
  description = "Defines the Tiers to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
}

variable "allow_blob_public_access" {
  type        = bool
  default     = false
  description = "Allow or disallow public access to all blobs or containers in the storage account. Defaults to false"
}

variable "account_replication_types" {
  type        = list(string)
  default     = [""]
  description = "Defines the types of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
}

variable "static_website_index_document" {
  type        = list(string)
  default     = [""]
  description = "(option) If index document <html>."
}

variable "static_website_error_document" {
  type        = list(string)
  default     = [""]
  description = "(option) If error document <html>."
}

variable "network_rules_default_action" {
  type        = list(string)
  default     = [""]
  description = ""
}

variable "network_rules_bypass" {
  type        = list(string)
  default     = [""]
  description = ""
}

variable "network_rules_ip_rules" {
  type        = list(string)
  default     = [""]
  description = ""
}

variable "enable_storage_container" {
  type        = bool
  default     = false
  description = "(required) main switch whether to create the storage account container."
}

variable "storage_container_count" {
  type        = number
  default     = 0
  description = "(required) number of create the storage account container."
}

variable "storage_account_container_names" {
  type        = list(string)
  description = "Specifies the names of the storage account container."
}

variable "container_access_types" {
  type        = list(string)
  description = "Specifies the access type of the storage account container."
}
