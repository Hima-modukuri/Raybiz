terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "aks" {
  source              = "./aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  dns_prefix          = var.dns_prefix
  node_count          = var.node_count
  vm_size             = var.vm_size
}

module "mysql" {
  source                = "./mysql"
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
  source                = "./vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
  vm_name               = var.vm_name
  network_interface_id  = var.vm_network_interface_id
  publisher             = var.vm_publisher
  offer                 = var.vm_offer
  sku                   = var.vm_sku
  version               = var.vm_version
  admin_username        = var.vm_admin_username
  admin_password        = var.vm_admin_password
  vm_size               = var.vm_vm_size
}
