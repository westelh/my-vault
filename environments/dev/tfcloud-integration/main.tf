terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "tfcloud-integration-dev"
      project = "my-vault-dev"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}
