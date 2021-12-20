output "storage_account_ids" {
  value = azurerm_storage_account.storageAccount.*.id
}

output "storage_account_names" {
  value = azurerm_storage_account.storageAccount.*.name
}

output "storageAccountBlobUrl" {
  value = formatlist("%s.blob.core.windows.net", azurerm_storage_account.storageAccount.*.name)
}

output "connection_string" {
  value = azurerm_storage_account.storageAccount.*.primary_connection_string
}
