output "vm_names" {
  value = {
    for k, vm in azurerm_virtual_machine.vm_infrasapp :
    k => vm.name
  }
}