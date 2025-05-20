terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "kubernetes-engine-prod"
      project = "my-vault-prod"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}
