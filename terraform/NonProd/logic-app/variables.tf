variable "subscription_id" {
  description = "Azure subscription ID for Non-Prod"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "uksouth"
}

variable "environment" {
  description = "Environment label (e.g. nonprod)"
  type        = string
  default     = "nonprod"
}

variable "project" {
  description = "Project name used in resource naming"
  type        = string
  default     = "dataplatform"
}

variable "owner" {
  description = "Owner or team responsible for these resources"
  type        = string
  default     = "data-engineering"
}

variable "resource_group_name" {
  description = "Name of the resource group for Logic App resources"
  type        = string
  default     = "rg-logicapp-nonprod-uksouth"
}

variable "logic_app_name" {
  description = "Name of the Azure Logic App workflow"
  type        = string
  default     = "la-dataplatform-nonprod-uksouth"
}

variable "logic_app_enabled" {
  description = "Whether the Logic App workflow is enabled"
  type        = bool
  default     = true
}


variable "workflow_parameters" {
  description = "Optional workflow parameter definitions keyed by parameter name as JSON-encoded strings"
  type        = map(string)
  default     = {}
}

variable "workflow_schema" {
  description = "Schema used by the Logic App workflow"
  type        = string
  default     = "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#"
}

variable "workflow_version" {
  description = "Version used by the Logic App workflow schema"
  type        = string
  default     = "1.0.0.0"
}

variable "parameters" {
  description = "Optional runtime parameter values for the Logic App workflow"
  type        = map(string)
  default     = {}
}