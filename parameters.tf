variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "region" {
  description = "Azure region"
  type        = string
}

variable "vm_name" {
  description = "Name of the existing virtual machine"
  type        = string
}

variable "disk_count" {
  description = "Number of data disks to attach"
  type        = number
}

variable "disk_size_gb" {
  description = "Size of each disk in GB"
  type        = number
}

variable "disk_type" {
  description = "Type of the managed disk (e.g. Standard_LRS, Premium_LRS)"
  type        = string
}

variable "disk_names" {
  description = "List of disk names"
  type        = list(string)
}
