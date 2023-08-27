# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.nome_grupo
  location = var.regiao_azure
}



resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.nome_maquina
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.instancia
  admin_username      = var.nome_usuario
  
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = var.nome_usuario
    public_key = file(var.chave_ssh)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

output "IP_publico" {
  value       = azurerm_public_ip.example.ip_address
}

output "username" {
  value       = azurerm_linux_virtual_machine.vm.admin_username
}



