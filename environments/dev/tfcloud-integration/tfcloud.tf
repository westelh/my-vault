locals {
  potential_secret_mounts = [
    "identity",
    "kv",
    "kubernetes",
  ]
}

module "sudo_policy" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "tfcloud-sudo-policy"
  description = "tfcloud's broad access to vault"
  rules = concat([for i in local.potential_secret_mounts : {
    description  = "Manage ${i} secret engine"
    path         = "${i}/*"
    capabilities = ["read", "create", "update", "delete"]
    }], [
    {
      description  = "Manage policies"
      path         = "sys/policies/acl/*"
      capabilities = ["read", "create", "update", "delete"]
    },
    {
      description  = "Manage secret mounts"
      path         = "sys/mounts/*"
      capabilities = ["read", "create", "update", "sudo", "delete"]
    },
    {
      description  = "Manage auth mounts"
      path         = "sys/auth/*"
      capabilities = ["read", "create", "update", "sudo", "delete"]
    },
    {
      description  = "Manage auth methods"
      path         = "auth/*"
      capabilities = ["read", "create", "update", "delete"]
    },
    {
      description  = "Remount"
      path         = "sys/remount"
      capabilities = ["update", "sudo"]
    },
    {
      description = "Remount status"
      path = "sys/remount/status/*"
      capabilities = ["read"]
    }
  ])
}

module "tfcloud" {
  source    = "westelh/tfcloud-integration/vault"
  version   = "1.0.0"
  auth_path = "tfc"
  roles = {
    admin = {
      workspace    = "*"
      project      = "my-vault-dev"
      organization = "westelh"
      policies = [
        "default",
        module.sudo_policy.name,
      ]
    }
  }
}

