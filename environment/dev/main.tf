module "rg" {
  source = "../../modules/azurerm_resource_group"
  rg     = var.rg
}

module "vnet" {
  source = "../../modules/azurerm_virtual_network"
  vnets  = var.vnets
  depends_on = [module.rg]
}

module "subnet" {
  source  = "../../modules/azurerm_subnet"
  subnets = var.subnets
  depends_on = [module.vnet]
}

module "nic" {
  source     = "../../modules/azurerm_nic"
  nics       = var.nics
  subnet_ids = module.subnet.subnet_ids
  depends_on = [module.subnet]
}

module "storage" {
  source = "../../modules/azurerm_storage_account"
  stgs   = var.stgs
  depends_on = [module.rg]
}
module "publicip" {
  source = "../../modules/azurerm_publicip"
  pips   = var.pips
  depends_on = [module.rg]
}

module "vm" {
  source  = "../../modules/azurerm_virtual_machine"
  vms     = var.vms
  nic_ids = module.nic.nic_ids
  depends_on = [module.nic]
}

module "sqlserver" {
  source     = "../../modules/azurerm_sqlserver"
  sqlservers = var.sqlservers
  depends_on = [module.rg]
}

module "sqldb" {
  source     = "../../modules/azurerm_sqldatabase"
  sqls       = var.sqls
  server_ids = module.sqlserver.server_id
  depends_on = [module.sqlserver]
}
