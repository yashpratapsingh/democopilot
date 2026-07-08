# Remote state outputs consumed by this module if cross-stack references are needed.
# Example: networking stack outputs such as vnet and subnet IDs.
#
# data "terraform_remote_state" "networking" {
#   backend = "azurerm"
#   config = {
#     resource_group_name  = "rg-tfstate-nonprod-uksouth"
#     storage_account_name = "sttfstatenonprod"
#     container_name       = "tfstate"
#     key                  = "nonprod/networking/terraform.tfstate"
#   }
# }