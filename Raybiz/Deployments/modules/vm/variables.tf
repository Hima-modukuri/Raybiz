variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
}

variable "tags" {
  description = "Tags for resources"
}

variable "vm_size" {
  description = "Size of the VM"
  default = "StandardB4ms"
}




