
resource "azurerm_eventhub_namespace" "namespace" {
  name                = var.namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  capacity            = var.capacity
  tags                = var.tags
  network_rulesets    = [ 
    { 
      default_action = "Deny"
      virtual_network_rule = var.allowed_subnets
    }
   ]
}

resource "azurerm_eventhub" "hub" {
  for_each = { for hub in var.hubs : hub.name => hub }

  name                                           = each.key
  resource_group_name                            = var.resource_group_name
  namespace_name                                 = azurerm_eventhub_namespace.namespace.name
  partition_count                                = each.value.partition_count 
  message_retention                              = each.value.message_retention

}