provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name = "himabindurg"
    storage_account_name = "himabindustorage"
    container_name = "mysqlterraformstatefile"
    key = "terraformstatefile_mysql_storage"
    access_key = "blq2QYZoGdZizxMcPhATPliuLD9EPRNWocbeQNhY207CbeBEvaDWoGsSc1MiGzSmPOLBiq9wvwYT+AStsXWMYg=="
  }
}

resource "azurerm_mysql_server" "mysql" {
  name                    = "himabindumysqlserver1234"
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = var.mysql_sku_name
  version                 = var.mysql_version
  administrator_login     = var.admin_username
  administrator_login_password = var.admin_password
  ssl_enforcement_enabled = true
  storage_mb              = "5120"
  backup_retention_days   = 7
  geo_redundant_backup_enabled = true
  tags                = var.tags
}

resource "azurerm_mysql_database" "example" {
  name                = "himabindumysqldatabase1234"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}

