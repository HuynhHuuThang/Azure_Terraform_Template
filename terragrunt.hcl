# Root terragrunt.hcl configuration
# This file contains common configurations that will be inherited by all environments

# Generate provider configuration
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
EOF
}

# Default remote state configuration (can be overridden by child configurations)
remote_state {
  backend = "local"
  config = {
    path = "terraform.tfstate"
  }
}

# Common inputs that can be overridden by child configurations
inputs = {
  # Common tags
  tags = {
    Environment = "dev"
    Project     = "IAC-Terraform"
    ManagedBy   = "Terragrunt"
  }
}