terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "auth0-dev"
      project = "my-vault-dev"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

