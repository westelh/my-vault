terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "kubernetes-engine-dev"
      project = "my-vault-dev"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

