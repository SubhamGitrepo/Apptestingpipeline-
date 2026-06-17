output "virtual_network_id" {
  value = { for k, vnet in azurerm_virtual_network.vnet_infra : k => vnet.id }
}