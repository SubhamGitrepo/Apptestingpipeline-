resource "azurerm_network_interface" "nic_infra" {

  for_each = var.nics
  name                = each.value.nics
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

  

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_ids[each.value.subnet_key]
    private_ip_address_allocation = "Dynamic"
  }
}