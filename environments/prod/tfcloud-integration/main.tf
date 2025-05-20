terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "tfcloud-integration-prod"
      project = "my-vault-prod"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

