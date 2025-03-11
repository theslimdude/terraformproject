resource "azurerm_resource_group" "n01720189-RG" {
  name     = var.rg_name
  location = var.location
  tags = local.common_tags
}
