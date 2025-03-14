resource "azurerm_key_vault" "akv" {
  name                      = var.akv_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  tenant_id                 = var.tenant_id
  sku_name                  = "standard"
  enable_rbac_authorization = true
}
