variable "resource_group_name" {
  description = "The name of the resource group in which to create the database. This must be the same as Database Server resource group currently."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sql_server_names" {
  type        = list(string)
  description = "The name of the SQL Server on which to create the database."
}


variable "sql_database_names" {
  type        = list(string)
  description = "The name of the database."
}

variable "sql_database_editions" {
  type        = list(string)
  description = "The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web. Please see Azure SQL Database Service Tiers.(https://azure.microsoft.com/en-gb/documentation/articles/sql-database-service-tiers/)"
}

variable "sql_database_max_size_bytes" {
  type        = list(string)
  description = "The maximum size that the database can grow to. Applies only if create_mode is Default. Please see Azure SQL Database Service Tiers."
}

variable "create_models" {
  type        = list(string)
  description = "(Optional) Specifies how to create the database."
}

