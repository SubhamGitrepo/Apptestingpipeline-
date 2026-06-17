output "subnet_id" {
  value = { for k, subnet in azurerm_subnet.subnets_infra : k => subnet.id }
}

output "subnet_ids" {
  value = {
    for k, subnet in azurerm_subnet.subnets_infra :
    k => subnet.id
  }
}