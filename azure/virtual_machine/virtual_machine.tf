resource "azurerm_virtual_machine" "vm1" {
    name                  = "${var.vm_name}"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.resource_group.name}"
    network_interface_ids = ["${azurerm_network_interface.nic1.id}"]
    vm_size               = "${var.vm_size}"

    storage_os_disk {
        name              = "${var.vm_name}_os"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "${var.vm_publisher}"
        offer     = "${var.vm_offer}"
        sku       = "${var.vm_sku}"
        version   = "latest"
    }

    os_profile {
        computer_name  = "${var.vm_name}"
        admin_username = "${var.admin_username}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/${var.admin_username}/.ssh/authorized_keys"
            key_data = "${var.admin_pubkey}"
        }
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.diagStor.primary_blob_endpoint}"
    }
}