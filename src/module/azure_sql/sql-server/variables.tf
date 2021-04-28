variable "resource_group_name" {
  description="The name of the resource group in which to create the SQL Server."
}

variable "location" {
  description="Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sql_server_name" {
  description="The name of the SQL Server. This needs to be globally unique within Azure."
}

variable "sql_server_administrator_login" {
  description="The administrator login name for the new server. Changing this forces a new resource to be created."
}

variable "sql_server_administrator_login_password" {
  description="The password associated with the administrator_login user. Needs to comply with Azure's Password Policy(https://msdn.microsoft.com/library/ms161959.aspx)"
}

