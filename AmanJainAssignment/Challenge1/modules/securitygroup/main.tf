resource "azurerm_network_security_group" "web_nsg" {
  name                = "web_nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "ssh_rule_1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  }

  security_rule {
    name                       = "ssh_rule_2"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_address_prefix      = "192.168.3.0/24"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  }
}

resource "azurerm_subnet_network_security_group_association" "web_nsg_subnet" {
  subnet_id                 = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}


resource "azurerm_network_security_group" "app_nsg" {
  name                = "app_nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "ssh_rule_1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "192.168.1.0/24"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  }

  security_rule {
    name                       = "ssh_rule_2"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "192.168.1.0/24"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  }
}

resource "azurerm_subnet_network_security_group_association" "app_nsg_subnet" {
  subnet_id                 = var.app_subnet_id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}


resource "azurerm_network_security_group" "db_nsg" {
  name                = "db_nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "ssh_rule_1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "192.168.2.0/24"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "3306"
  }

  security_rule {
    name                       = "ssh_rule_2"
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "192.168.2.0/24"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "3306"
  }

  security_rule {
    name                       = "ssh_rule_3"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_address_prefix      = "192.168.1.0/24"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "3306"
  }
}

resource "azurerm_subnet_network_security_group_association" "db_nsg_subnet" {
  subnet_id                 = var.db_subnet_id
  network_security_group_id = azurerm_network_security_group.db_nsg.id
}


