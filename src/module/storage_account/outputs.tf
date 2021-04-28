output "storage_account_id" {
  value = azurerm_storage_account.storageAccount.id
}

output "storage_account_name" {
  value = azurerm_storage_account.storageAccount.name
}

output "storageAccountBlobUrl" {
  value = "${azurerm_storage_account.storageAccount.name}.blob.core.windows.net"
}
