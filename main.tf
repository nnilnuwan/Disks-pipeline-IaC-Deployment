# Get the existing VM
data "azurerm_virtual_machine" "target_vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
}

# Create N managed disks
resource "azurerm_managed_disk" "data_disk" {
  count                = var.disk_count
  name                 = "${var.vm_name}-data-disk-${count.index + 1}"
  location             = var.region
  resource_group_name  = var.resource_group_name
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
}

# Attach each disk to the VM
resource "azurerm_virtual_machine_data_disk_attachment" "attach_disk" {
  count               = var.disk_count
  managed_disk_id     = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id  = data.azurerm_virtual_machine.target_vm.id
  lun                 = count.index
  caching             = "ReadWrite"
}
