output "public_ip_ids" {
  value = {
    for k, pip in azurerm_public_ip.publicip_infras :
    k => pip.id
  }
}

output "public_ip_addresses" {
  value = {
    for k, pip in azurerm_public_ip.publicip_infras :
    k => pip.ip_address
  }
}