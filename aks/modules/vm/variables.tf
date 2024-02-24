variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
}

variable "tags" {
  description = "Tags for resources"
}

variable "vm_name" {
  description = "Name of VM"
}

variable "network_interface_id" {
  description = "ID of the network interface for VM"
}

variable "publisher" {
  description = "Publisher for the VM image"
}

variable "offer" {
  description = "Offer for the VM image"
}

variable "sku" {
  description = "SKU for the VM image"
}

variable "version" {
  description = "Version for the VM image"
}

variable "admin_username" {
  description = "Admin username for VM"
}

variable "admin_password" {
  description = "Admin password for VM"
}

variable "vm_size" {
  description = "VM size for VM"
}
