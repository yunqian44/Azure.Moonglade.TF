variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account. Changing this forces a new resource to be created"
}

variable "storage_account_name" {
  description = "Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
}


variable "static_website" {
  default = {
    index_document = ""
    error_document = ""
  }

  description = "static_website can only be set when the account_kind is set to StorageV2"
}

variable "network_rules" {
  default = {
    default_action = ""
    bypass         = []
    ip_rules       = []
  }
  description = "If specifying network_rules, one of either ip_rules or virtual_network_subnet_ids must be specified and default_action must be set to Deny."
}
