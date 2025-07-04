
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.2"
  suffix = ["devsecops"]
  prefix = ["dev"]
}




module "avm-res-web-serverfarm" {
  
 
  source  = "Azure/avm-res-web-serverfarm/azurerm"
  version = "0.7.0"
  # insert the 4 required variables here
  resource_group_name = "shahbazdemo"
  os_type             = "Linux"
  location            = "West US2"
  name                = module.naming.app_service_plan.name
  worker_count = 1
    sku_name = "B1"
    zone_balancing_enabled = false
  }

  module "avm-res-web-site" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "0.17.2"
  # insert the 6 required variables here
    kind = "webapp"
    resource_group_name = "shahbazdemo"
    os_type             = "Linux"
    location            = "West US2"
    name                = module.naming.app_service.name
    service_plan_resource_id = module.avm-res-web-serverfarm.resource_id
}