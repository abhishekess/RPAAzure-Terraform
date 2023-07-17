
resource "azurerm_resource_group" "rg" {
  location = var.resource_location
  name     = "${var.context}-${var.stage}-rg"
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.context}${var.stage}cr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true

  tags = {
    STAGE   = var.stage
    CONTEXT = var.context
  }
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.context}-${var.stage}-k8s"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.context}-${var.stage}-dns"

  default_node_pool {
    name       = "systempool"
    vm_size    = "Standard_D2_v3"
    node_count = var.node_count
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = {
    STAGE   = var.stage
    CONTEXT = var.context
  }
}

resource "azurerm_role_assignment" "k8s_to_acr" {
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
  principal_id         = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}