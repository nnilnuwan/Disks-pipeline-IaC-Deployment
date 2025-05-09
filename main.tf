provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_managed_disk" "data_disk" {
  name                 = var.disk_name
  location             = data.azurerm_resource_group.rg.location
  resource_group_name  = data.azurerm_resource_group.rg.name
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb

  lifecycle {
    prevent_destroy = true
  }
}


resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  managed_disk_id    = azurerm_managed_disk.data_disk.id
  virtual_machine_id = data.azurerm_virtual_machine.vm.id
  lun                = var.lun
  caching            = "ReadWrite"

  lifecycle {
    prevent_destroy = true
  }
}

