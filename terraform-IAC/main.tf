
module "naming" {
  source  = "Azure/naming/azurerm"

  suffix = [var.name]
  prefix = [var.myenv]
}

resource "azurerm_resource_group" "rg" {
  name = module.naming.resource_group.name
  location = var.location
}

module "avm-res-web-serverfarm" { 
  source  = "Azure/avm-res-web-serverfarm/azurerm"
  version = "0.7.0"
  # insert the 4 required variables here
  name                = module.naming.app_service_plan.name
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  os_type             = "Linux"

  worker_count = 1
    sku_name = "B1"
    zone_balancing_enabled = false
  }

  module "avm-res-web-site" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "0.17.2"
  # insert the 6 required variables here
    name                = module.naming.app_service.name
    resource_group_name = azurerm_resource_group.rg.name
    location            = var.location
    service_plan_resource_id = module.avm-res-web-serverfarm.resource_id
    kind = "webapp"
    os_type             = "Linux"
}




resource "azurerm_key_vault" "name" {
  name = module.naming.key_vault.name
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id       = "104e77d4-81e7-4c16-ab44-935220bed6dd"
  sku_name = "standard"

  purge_protection_enabled = false
  soft_delete_retention_days = null

}
