resource "azurerm_mssql_server" "sqlserver_infras" {
    for_each = var.sqlservers
  name                         = each.value.sql_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.rg_location 
  version                      = "12.0"
  administrator_login          = each.value.administrator.login
  administrator_login_password = each.value.adpassword
  minimum_tls_version          = "1.2"

  # azuread_administrator is not configured because Azure AD object IDs must be valid.
  # Remove or configure this block only if you have a real Azure AD user/group object ID.

}
