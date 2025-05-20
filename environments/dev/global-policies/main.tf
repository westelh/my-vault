terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "global-policies-dev"
      project = "my-vault-dev"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

