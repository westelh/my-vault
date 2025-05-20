terraform {
  cloud {
    organization = "westelh"
    workspaces {
      name    = "oidc-dev"
      project = "my-vault-dev"
    }
  }
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

resource "vault_identity_oidc" "config" {
  issuer = "https://vault.westelh.dev"
}

resource "vault_identity_oidc_role" "default" {
  name     = "default"
  key      = "default"
  template = <<-EOT
    {
      "entity_id": {{ identity.entity.id }},
      "entity_name": {{ identity.entity.name }},
      "google_id": {{ identity.entity.metadata.google_id }}
    }
  EOT
}

