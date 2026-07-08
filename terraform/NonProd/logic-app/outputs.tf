output "resource_group_id" {
  description = "Resource ID of the Logic App resource group"
  value       = azurerm_resource_group.this.id
}

output "logic_app_id" {
  description = "Resource ID of the Azure Logic App workflow"
  value       = azurerm_logic_app_workflow.this.id
}

output "logic_app_name" {
  description = "Name of the Azure Logic App workflow"
  value       = azurerm_logic_app_workflow.this.name
}

output "logic_app_access_endpoint" {
  description = "Access endpoint exposed by the Azure Logic App workflow"
  value       = azurerm_logic_app_workflow.this.access_endpoint
}