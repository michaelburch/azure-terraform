# azure-terraform
Basic Terraform Modules for Azure

## Example usage

module "vnet" {
  source = "github.com/michaelburch/azure-terraform/modules/virtual_network"
}

## Target a specific branch

module "vnet" {
  source = "github.com/michaelburch/azure-terraform/modules/virtual_network?ref=main"
}