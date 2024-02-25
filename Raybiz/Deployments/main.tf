terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.2"
    }
  }
}  

module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  node_count          = var.node_count
  vm_size             = var.vm_size
}

module "mysql" {
  source                = "./modules/mysql"
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
  mysql_sku_name        = var.mysql_sku_name
  mysql_version         = var.mysql_version
  admin_username        = var.mysql_admin_username
  admin_password        = var.mysql_admin_password
  mysql_server_name     = var.mysql_server_name
}

module "vm" {
  source                = "./modules/vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

