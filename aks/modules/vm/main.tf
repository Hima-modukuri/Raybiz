provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "Vnet" {
  name                = Himabindu-VPC
  address_space       = "10.0.0.0/26"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
}
resource "azurerm_subnet" "subnet" {
    name = "Himabindu-subnet"
    resource_group_name = azurerm_resource_group.aks.name
    virtual_network_name = azurerm_virtual_network.Vnet.name
    address_prefixes = [ "10.0.2.0/24" ]
  
}

resource "azurerm_public_ip" "" {
  name = "public_ip"
  resource_group_name =  azurerm_resource_group.aks.name
  location = azurerm_resource_group.aks.location
  allocation_method = "Static"
  
}

resource "azurerm_network_interface" "network-interface" {
  name = "Himabindu-network-interface"
  location = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  ip_configuration {
    name = "external"
    subnet_id = azurerm_subnet.tflabelwebsubnet101.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.tflabelwebpublicip101.id
  }
}


resource "azurerm_network_interface" "main" {
  name                = "himabindu-nic"
  location              = azurerm_resource_group.aks.location
  resource_group_name   = azurerm_resource_group.aks.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
}
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.azurerm_resource_group.aks.location
  resource_group_name   = var.azurerm_resource_group.aks.name
  vm_size               = var.vm_size
  network_interface_ids = [azurerm_network_interface.main.id]


  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
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
