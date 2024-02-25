variable "resource_group_name" {
  description = "Name of the resource group for AKS"
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
  description = "VM size for AKS nodes and VM"
}

variable "mysql_sku_name" {
  description = "SKU name for MySQL"
}

variable "mysql_version" {
  description = "Version of MySQL"
}

variable "mysql_admin_username" {
  description = "Admin username for MySQL"
}

variable "mysql_admin_password" {
  description = "Admin password for MySQL"
}

variable "mysql_server_name" {
  description = "Name of MySQL server"
}

variable "vm_name" {
  description = "Name of VM"
}

variable "vm_publisher" {
  description = "Publisher for the VM image"
}

variable "vm_offer" {
  description = "Offer for the VM image"
}

variable "vm_sku" {
  description = "SKU for the VM image"
}

variable "purpose" {
  description = "Purpose tag value"
  type        = string
  default     = "RBT-interview"
}

variable "created_by" {
  description = "Created By tag value"
  type        = string
  default     = "Himabindu"
}



