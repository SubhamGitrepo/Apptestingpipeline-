output "resource_group_id" {
  value = { for k, rg in azurerm_resource_group.rgs : k => rg.id }
}
