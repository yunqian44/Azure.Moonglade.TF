output "storage_account_ids" {
  value = azurerm_storage_account.storageAccount.*.id
}

output "storage_account_names" {
  value = azurerm_storage_account.storageAccount.*.name
}

output "storageAccountBlobUrl" {
  //for_each = toset(azurerm_storage_account.storageAccount.*.name)
  
  //value = "${each.key}.blob.core.windows.net"
  value = formatlist("%s.blob.core.windows.net", azurerm_storage_account.storageAccount.*.name)
  //value = "${azurerm_storage_account.storageAccount.name}.blob.core.windows.net"
}
