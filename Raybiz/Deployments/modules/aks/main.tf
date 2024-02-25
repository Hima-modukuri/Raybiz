provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name = "himabindurg"
    storage_account_name = "himabindustorage"
    container_name = "aksterraformstatefile"
    key = "terraformstatefile_aks_storage"
    access_key = "blq2QYZoGdZizxMcPhATPliuLD9EPRNWocbeQNhY207CbeBEvaDWoGsSc1MiGzSmPOLBiq9wvwYT+AStsXWMYg=="
  }
}
resource "azurerm_container_registry" "acr" {
  name                = "himabindu1234acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.aks]
  filename     = "kubeconfig"
  content      = azurerm_kubernetes_cluster.aks.kube_config_raw
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "himabinduaks1234"
  kubernetes_version  = "1.27.7"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix = "Dev"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet" 
  }

  tags = var.tags
}
