locals {
  tags = {
    environment = var.environment
    project     = var.project
    owner       = var.owner
    managed_by  = "terraform"
    capability  = "logic-app"
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

resource "azurerm_logic_app_workflow" "this" {
  name                = var.logic_app_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  enabled             = var.logic_app_enabled
  tags                = local.tags

  workflow_parameters = var.workflow_parameters
  workflow_schema     = var.workflow_schema
  workflow_version    = var.workflow_version
  parameters          = var.parameters
}