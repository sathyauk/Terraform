resource "azurerm_storage_account" "jpastorage" {
  name                     = "jpastorageacc1898"
  resource_group_name      = "${azurerm_resource_group.myresourcegroup.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "uat"
  }
}