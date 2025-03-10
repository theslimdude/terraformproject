module "rgroup-n01720189" {
  source   = "./modules/rgroup-n01720189"
  rg_name  = "n01720189-RG"
  location = "Canada Central"
}

module "network-n01720189" {
  source                = "./modules/network-n01720189"
  vnet_name             = "n01720189-vnet"
  vnet_address_space    = ["10.0.0.0/16"]
  location              = module.rgroup-n01720189.location
  rg_name               = module.rgroup-n01720189.rg_name
  subnet_name           = "n01720189-subnet"
  subnet_address_prefix = ["10.0.1.0/24"]
  nsg_name              = "n01720189-nsg"
}

module "common-n01720189" {
  source    = "./modules/common-n01720189"
  law_name  = "n01720189-law"
  log_sku   = "PerGB2018"
  retention = 30
  location  = module.rgroup-n01720189.location
  rg_name   = module.rgroup-n01720189.rg_name
  rsv_name  = "n01720189-rsv"
  vault_sku = "Standard"
  sa_name   = "n01720189sa"
}

module "vmlinux-n01720189" {
  source                = "./modules/vmlinux-n01720189"
  availability_set_name = "n01720189-linux-avset"
  location              = module.rgroup-n01720189.location
  rg_name               = module.rgroup-n01720189.rg_name
  vm_name = {
    "lnx-n01720189v1" = "vm1dns"
  }
  admin_username                       = "n01720189-linux-user"
  subnet_id                            = module.network-n01720189.subnet_id
  boot_diagnostics_storage_account_uri = module.common-n01720189.storage_account_primary_blob_endpoint
}

module "vmwindows-n01720189" {
  source                               = "./modules/vmwindows-n01720189"
  resource_group_name                  = module.rgroup-n01720189.rg_name
  vm_name                              = "n01720189"
  location                             = module.rgroup-n01720189.location
  availability_set_name                = "n01720189-windows-avset"
  vm_count                             = 1
  vm_size                              = "Standard_B1ms"
  admin_username                       = "n01720189"
  admin_password                       = "_z7Urg.?A}DExkp"
  subnet_id                            = module.network-n01720189.subnet_id
  boot_diagnostics_storage_account_uri = module.common-n01720189.storage_account_primary_blob_endpoint
}

module "datadisk-n01720189" {
  source         = "./modules/datadisk-n01720189"
  disk_count     = 4
  vm_name        = concat(module.vmlinux-n01720189.vm_info.hostname, module.vmwindows-n01720189.vm_info.hostname)
  linux_vm_ids   = module.vmlinux-n01720189.vm_info.linux_vm_ids
  windows_vm_ids = module.vmwindows-n01720189.vm_info.windows_vm_id
  location       = module.rgroup-n01720189.location
  rg_name        = module.rgroup-n01720189.rg_name
}

module "loadbalancer-n01720189" {
  source                = "./modules/loadbalancer-n01720189"
  loadbalancer_name     = "assignmentllb"
  location              = module.rgroup-n01720189.location
  rg_name               = module.rgroup-n01720189.rg_name
  vm_name               = module.vmlinux-n01720189.vm_info.hostname
  network_interface_ids = module.vmlinux-n01720189.vm_info.linux_network_ids
}

module "database-n01720189" {
  source              = "./modules/database-n01720189"
  location            = module.rgroup-n01720189.location
  resource_group_name = module.rgroup-n01720189.rg_name
  admin_username      = "n01720189"
  admin_password      = "_z7Urg.?A}DExkp"
  db_server_name      = "n01720189-postgresql-server"
  db_sku_name         = "B_Gen5_2"
  db_version          = "11"
}
