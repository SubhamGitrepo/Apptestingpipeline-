resource "azurerm_virtual_machine" "vm_infrasapp" {
  for_each = var.vms
  name                  = each.value.vm_name
  location              = each.value.rg_location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [var.nic_ids[each.value.nic1]]
  vm_size               = "Standard_DC1ds_v3"



  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = each.value.computer_name
    admin_username = each.value.username
    admin_password = each.value.password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
 
}