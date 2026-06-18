rg = {

   dev = {

        rg_name = "rg_prod"
        rg_location = "Central India"
}

}

stgs = {

    dev = {

        stg_name = "stgprodxyz98765"
        rg_name  = "rg_prod"
        rg_location = "Central India"

      }

}  

vnets = {

    vnet1 = {

        vnet_name = "vnet_prod"
        rg_location = "Central India"
        rg_name  = "rg_prod"

}

  vnet21 = {

        vnet_name = "vnet_prod1"
        rg_location = "Central India"
        rg_name  = "rg_prod"

}


} 

subnets = {

    subnet1 = {

        subnets_name = "infra_subnet"
        rg_name  = "rg_prod"
        vnet_name = "vnet_prod1"

        }


} 

nics = {
  nic1 = {
    nics        = "nic-1"
    rg_location = "Central India"
    rg_name     = "rg_prod"
    subnet_key  = "subnet1"   # 👈 must match
  }
}



vms = {
  vm1 = {
    vm_name      = "vm-prod-1"
    rg_name      = "rg_prod"
    rg_location  = "Central India"
    nic1         = "nic1"
    computer_name = "vmprod1"
    username     = "azureuser"
    password     = "P@ssw0rd1234!"
  }
}

sqlservers = {
  sql1 = {
    sql_name = "sqlserverprod9999"
    rg_name  = "rg_prod"
    rg_location = "Central India"
    administrator = {
      login = "sqladmin"
    }
    adpassword       = "SqlP@ssw0rd123!"
    sqlsewrver_login = "sqladmin@yourdomain.com"
  }
}

sqls = {
  db1 = {
    sql_name = "sqldb-prod"
    server1  = "sql1"
  }
}

pips = {
  pip1 = {
    pip_name   = "pip-prod-1"
    rg_name    = "rg_prod"
    rg_location = "Central India"
  }
}