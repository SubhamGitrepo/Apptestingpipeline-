output "storage_account_name" {
  value = { for k, stg in azurerm_storage_account.stg : k => stg.name }
}

output "storage_account_id" {
  value = { for k, stg in azurerm_storage_account.stg : k => stg.id }
}