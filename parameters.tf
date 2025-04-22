variable "vm_name" {
  description = "The name of the existing Virtual Machine"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group containing the VM"
  type        = string
}

variable "region" {
  description = "Azure region where the VM and disks are located"
  type        = string
}

variable "disk_type" {
  description = "The type of managed disk to attach"
  type        = string
  #default     = "Standard_LRS"
}

variable "disk_count" {
  description = "Number of data disks to attach"
  type        = number
  #default     = 1
}

variable "disk_size_gb" {
  description = "Size of each disk in GB"
  type        = number
  #default     = 128
}
