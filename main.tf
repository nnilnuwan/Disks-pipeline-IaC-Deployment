provider "azurerm" {
  features {}
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "region" {
  description = "The region for resources"
  type        = string
}

variable "disk_type" {
  description = "The disk type (Standard_LRS, Premium_LRS, etc.)"
  type        = string
}

variable "disk_size_gb" {
  description = "The size of the disk in GB"
  type        = number
}

variable "disk_names" {
  description = "List of disk names"
  type        = list(string)
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_managed_disk" "data_disk" {
  count                 = var.disk_count
  name                  = var.disk_names[count.index]
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  storage_account_type  = var.disk_type
  create_option         = "Empty"
  disk_size_gb          = var.disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  count               = var.disk_count
  managed_disk_id     = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id  = data.azurerm_virtual_machine.vm.id
  lun                 = count.index
  caching             = "ReadWrite"
}
