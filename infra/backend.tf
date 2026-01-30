terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatecurso24188" # To get the storage account name run: az storage account list --query "[0].name"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
