resource "azurerm_mssql_database" "sql_infra" {

  for_each = var.sqls
  name         = each.value.sql_name
  server_id    = var.server_ids[each.value.server1]
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  
}