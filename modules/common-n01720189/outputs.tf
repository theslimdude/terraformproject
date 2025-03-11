output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.n01720189-law.name
}

output "recovery_services_vault_name" {
  value = azurerm_recovery_services_vault.n01720189-rsv.name
}

output "storage_account_name" {
  value = azurerm_storage_account.n01720189-sa.name
}

output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.n01720189-sa.primary_blob_endpoint
}
