# public ips to be assigned to nics in corda subnet
resource "azurerm_public_ip" "mypips" {
  count = 1
  name                         = "${element(var.pipnames, 0)}"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.myresourcegroup.name}"
  allocation_method            = "Dynamic"
}