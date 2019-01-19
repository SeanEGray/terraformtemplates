resource "azurerm_virtual_network" "vnet" {
    name                = "vnet1"
    address_space       = ["10.0.0.0/16"]
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
}

resource "azurerm_subnet" "subnet1" {
    name                 = "vmSubnet"
    resource_group_name  = "${azurerm_resource_group.resource_group.name}"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    address_prefix       = "10.0.2.0/24"
}

resource "azurerm_public_ip" "pip1" {
    name                         = "vm1Pip"
    location                     = "${var.location}"
    resource_group_name          = "${azurerm_resource_group.resource_group.name}"
    allocation_method            = "Dynamic"
}

resource "azurerm_network_security_group" "nsg1" {
    name                = "vm1Nsg"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

resource "azurerm_network_interface" "nic1" {
    name                = "vm1Nic"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    network_security_group_id = "${azurerm_network_security_group.nsg1.id}"

    ip_configuration {
        name                          = "vm1NicConfig"
        subnet_id                     = "${azurerm_subnet.subnet1.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${azurerm_public_ip.pip1.id}"
    }
}
