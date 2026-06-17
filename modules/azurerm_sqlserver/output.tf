output "server_id" {
  value = {
    for k, server in azurerm_mssql_server.sqlserver_infras:
    k => server.id
  }
}