variable "enable_sql_server" {
  type        = bool
  default     = false
  description = "(required) main switch whether to create the SQL Server."
}

variable "sql_server_count" {
  type        = number
  default     = 0
  description = "(required) number of create the SQL Server."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the SQL Server."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sql_server_names" {
  type        = list(string)
  description = "The name of the SQL Server. This needs to be globally unique within Azure."
}

variable "sql_server_versions" {
  type        = list(string)
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
}

variable "sql_server_administrator_logins" {
  type        = list(string)
  description = "The administrator login name for the new server. Changing this forces a new resource to be created."
}

variable "sql_server_administrator_login_passwords" {
  type        = list(string)
  description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy(https://msdn.microsoft.com/library/ms161959.aspx)"
}

variable "enable_sql_server_firewall_rule" {
  type        = bool
  default     = false
  description = "(required) main switch whether to create the SQL Server Firewall Rule."
}

variable "sql_server_firewall_rule_count" {
  type        = number
  default     = 0
  description = "(required) number of create the SQL Server Firwall Rule."
}

variable "sql_server_firewall_rule_names" {
  type        = list(string)
  description = "(Required) The name of the firewall rule."
}

variable "start_ip_address" {
  type        = list(string)
  description = "Required) The starting IP address to allow through the firewall for this rule."
}

variable "end_ip_address" {
  type        = list(string)
  description = "(Required) The ending IP address to allow through the firewall for this rule."
}

