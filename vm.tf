resource "azurerm_virtual_machine" "myDNS1vm" {
  count = 1
  depends_on = ["azurerm_resource_group.myresourcegroup","azurerm_virtual_network.myvnet","azurerm_subnet.mysubnet5","azurerm_network_interface.mynics"]
  name                  = "${element(var.dnsvmnames, count.index)}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.myresourcegroup.name}"
  network_interface_ids = ["${element(azurerm_network_interface.mynics.*.id, count.index+1)}"]
  vm_size               = "Standard_D2s_v3"
  #availability_set_id = "${azurerm_availability_set.avset.id}"
  delete_os_disk_on_termination = true

  storage_os_disk {
    name              = "OperatorDns-disk${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${element(var.dnsvmnames, count.index)}"
    admin_username = "${var.vmuser}"
    admin_password = "${var.vmpassword}"
  }

 os_profile_windows_config {}
 
}