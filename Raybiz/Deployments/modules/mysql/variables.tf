variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
}

variable "tags" {
  description = "Tags for resources"
}

variable "mysql_server_name" {
  description = "Name of the MySQL server"
}

variable "mysql_sku_name" {
  description = "SKU name for MySQL"
}

variable "mysql_version" {
  description = "Version of MySQL"
}

variable "admin_username" {
  description = "Administrator username for MySQL"
}

variable "admin_password" {
  description = "Administrator password for MySQL"
}

