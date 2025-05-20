terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "kv-prod"
      project = "my-vault-prod"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

resource "vault_mount" "kv" {
  path        = "kv"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_backend_v2" "kv" {
  mount = vault_mount.kv.path
}

