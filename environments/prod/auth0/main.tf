terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "auth0-prod"
      project = "my-vault-prod"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

provider "vault" {
  address = "https://vault.westelh.dev"
}
