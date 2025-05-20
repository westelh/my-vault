terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "global-policies-prod"
      project = "my-vault-prod"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

