terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-nonprod-uksouth"
    storage_account_name = "sttfstatenonprod"
    container_name       = "tfstate"
    key                  = "nonprod/logic-app/terraform.tfstate"
  }
}
