provider "azurerm" {
  features {}
}
terraform {
  backend "azurerm" {
    resource_group_name = "himabindurg"
    storage_account_name = "himabindustorage"
    container_name = "vmterraformstatefile"
    key = "terraformstatefile_vm_storage"
    access_key = "blq2QYZoGdZizxMcPhATPliuLD9EPRNWocbeQNhY207CbeBEvaDWoGsSc1MiGzSmPOLBiq9wvwYT+AStsXWMYg=="
  }
}
resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "Vnet" {
  name                = "Himabindu-VPC"
  address_space       = ["10.0.0.0/16S"]
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
}
resource "azurerm_subnet" "subnet" {
    name = "Himabindu-subnet"
    resource_group_name = azurerm_resource_group.aks.name
    virtual_network_name = azurerm_virtual_network.Vnet.name
    address_prefixes = [ "10.0.2.0/24" ]
  
}

resource "azurerm_public_ip" "publicip" {
  name = "public_ip"
  resource_group_name =  azurerm_resource_group.aks.name
  location = azurerm_resource_group.aks.location
  allocation_method = "Static"
  
}


resource "azurerm_network_interface" "main" {
  name                = "himabindu-nic"
  location              = azurerm_resource_group.aks.location
  resource_group_name   = azurerm_resource_group.aks.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "bindu-vm"
  location              = azurerm_resource_group.aks.location
  resource_group_name   = azurerm_resource_group.aks.name
  vm_size               = var.vm_size
  network_interface_ids = [azurerm_network_interface.main.id]


  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_profile {
    computer_name  = "Himabindu"
    admin_username = "Admin"
    admin_password = "Admin"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "Empty"
    managed_disk_type = "Premium_LRS"
    disk_size_gb      = "100"
  }

  tags = var.tags
}
