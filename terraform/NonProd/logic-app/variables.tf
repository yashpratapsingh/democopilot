variable "subscription_id" {
  description = "Azure subscription ID for Non-Prod"
  type        = string
}

variable "location" {
  description = "Azure region for Logic App resources"
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
  description = "Name of the Logic App workflow"
  type        = string
  default     = "la-dataplatform-nonprod-uksouth"
}
