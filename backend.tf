terraform {
    backend "azurerm" {
        storage_account_name = "cs2100320024d409b31" # Use your own unique name here
        container_name       = "cemaldeneme"        # Use your own container name here
        key                  = "terraform.tfstate"       # Add a name to the state file
        resource_group_name  = "cloud-shell-storage-eastus"         # Use your own resource group name here
    }
}