# create SQL instances required for this environment
resource "azurerm_sql_server" "mysqlserver" {
    name = "${var.sqlserver}"
    resource_group_name = "${azurerm_resource_group.myresourcegroup.name}"
    location = "${var.location}"
    version = "12.0"
    administrator_login = "${var.vmuser}"
    administrator_login_password = "${var.vmpassword}"
}

resource "azurerm_sql_database" "mysqldbs" {
  depends_on = ["azurerm_resource_group.myresourcegroup","azurerm_sql_server.mysqlserver"]
  count = 2
  name                = "${element(var.sqldbnames, count.index)}"
  resource_group_name = "${azurerm_resource_group.myresourcegroup.name}"
  location = "${var.location}"
  server_name = "${azurerm_sql_server.mysqlserver.name}"
}