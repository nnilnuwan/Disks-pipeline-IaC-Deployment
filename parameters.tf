variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "region" {
  type        = string
  description = "Azure region"
}

variable "vm_name" {
  type        = string
  description = "Name of the existing virtual machine"
}

variable "disk_count" {
  type        = number
  description = "Number of data disks to attach"
}

variable "disk_size_gb" {
  type        = number
  description = "Size of each disk in GB"
}

variable "disk_type" {
  type        = string
  description = "Type of the managed disk (e.g. Standard_LRS, Premium_LRS)"
}

variable "disk_names" {
  description = "List of disk names"
  type        = list(string)
}
