terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.32"
    }
  }
}

provider "azurerm" {
  features {

  }
  subscription_id = "9441bbd5-0154-42cc-a0bb-d6c94e0f0b3b"
}
