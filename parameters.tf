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

variable "disk_size_gb" {
  type        = number
  description = "Size of each disk in GB"
}

variable "disk_type" {
  type        = string
  description = "Type of the managed disk (e.g. Standard_LRS, Premium_LRS)"
}

variable "disk_name" {
  type        = string
  description = "Name of the disk"
}


variable "lun" {
  type        = number
  description = "Logical Unit Number for the data disk (must be unique per VM)"
}
