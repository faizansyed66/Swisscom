resource "azurerm_public_ip" "loadip" {
  name                = "load-ip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "appbalancer" {
  name                = "app-balancer"
  location            = var.location
  resource_group_name = var.resource_group
  sku = "Standard"
  sku_tier = "Regional"
  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public_ip.loadip.id
  }
  depends_on = [
    azurerm_public_ip.loadip
  ]
}

resource "azurerm_lb_backend_address_pool" "poolA" {
  loadbalancer_id = azurerm_lb.appbalancer.id
  name            = "PoolA"
  depends_on = [
    azurerm_lb.appbalancer
  ]
}

resource "azurerm_lb_backend_address_pool_address" "appvmaddress" {
  name                    = "web-vm"
  backend_address_pool_id = azurerm_lb_backend_address_pool.poolA.id
  virtual_network_id      = var.network_id
  ip_address              = var.interface_ip
  depends_on = [
    azurerm_lb_backend_address_pool.poolA,
    var.interface_name
  ]
}

resource "azurerm_lb_backend_address_pool_address" "appvmaddress2" {
  name                    = "web-vm2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.poolA.id
  virtual_network_id      = var.network_id
  ip_address              = var.interface2_ip
  depends_on = [
    azurerm_lb_backend_address_pool.poolA,
    var.interface2_name
  ]
}

resource "azurerm_lb_probe" "probeA" {
  loadbalancer_id = azurerm_lb.appbalancer.id
  name            = "probeA"
  port            = 80
  protocol = "Tcp"
  depends_on = [
    azurerm_lb.appbalancer
  ]
}

resource "azurerm_lb_rule" "RuleA" {
  loadbalancer_id                = azurerm_lb.appbalancer.id
  name                           = "RuleA"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontend-ip"
  probe_id = azurerm_lb_probe.probeA.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.poolA.id]
  depends_on = [
    azurerm_lb.appbalancer
  ]
}