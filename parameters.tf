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
  #default     = 1
}

variable "disk_size_gb" {
  type        = number
  description = "Size of each disk in GB"
  #default     = 128
}

variable "disk_type" {
  type        = string
  description = "Type of the managed disk (e.g. Standard_LRS, Premium_LRS)"
  #default     = "Standard_LRS"
}


variable "disk_names" {
  description = "List of disk names"
  type        = list(string)
}



