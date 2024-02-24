provider "azurerm" {
  features {}
}

resource "azurerm_mysql_server" "mysql" {
  name                = var.mysql_server_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.mysql_sku_name
  version             = var.mysql_version
  administrator_login = var.admin_username
  administrator_login_password = var.admin_password
  ssl_enforcement_enabled = true
  tags = var.tags
}
