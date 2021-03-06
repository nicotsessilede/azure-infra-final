resource "azurerm_container_group" "Container_instances" {
  name                = "${var.env}-continst"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  ip_address_type     = "public"
  dns_name_label      = "${var.env}-aci-label1"
  os_type             = "Linux"

  container {
    name   = "${var.env}-hello-world"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  container {
    name   = "sidecar"
    image  = "mcr.microsoft.com/azuredocs/aci-tutorial-sidecar"
    cpu    = "0.5"
    memory = "1.5"
  }

  tags = {
    "env" = "${var.env}"
  }
}
########### Added
data "azurerm_container_group" "mycon" {
  name                = azurerm_container_group.Container_instances.name
  resource_group_name = azurerm_resource_group.resource-group.name
}
