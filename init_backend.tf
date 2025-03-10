# Create Resource Group for Backend
resource "azurerm_resource_group" "tf_state_rg" {
  name     = "tfstaten01720189-RG"
  location = "Canada Central"
}

# Create Storage Account for Backend
resource "azurerm_storage_account" "tf_state_sa" {
  name                     = "tfstaten01720189sa"
  resource_group_name      = azurerm_resource_group.tf_state_rg.name
  location                 = azurerm_resource_group.tf_state_rg.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
}

# Create Storage Container for State Files
resource "azurerm_storage_container" "tf_state_container" {
  name                  = "tfstatefiles"
  storage_account_name  = azurerm_storage_account.tf_state_sa.name
}

