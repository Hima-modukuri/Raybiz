variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
}

variable "tags" {
  description = "Tags for resources"
}

variable "node_count" {
  description = "Number of nodes in AKS cluster"
}

variable "vm_size" {
  description = "VM size for AKS nodes"
}
