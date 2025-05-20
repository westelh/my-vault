locals {
  full_cap = ["read", "create", "update", "list", "delete", "sudo"]
}

module "manage_policies" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "manage-policies"
  description = "Policy to manage policies"
  rules = [
    {
      description  = "List access to root"
      path         = "sys/policies/acl"
      capabilities = ["list"]
    },
    {
      description  = "Full access to policies"
      path         = "sys/policies/acl/*"
      capabilities = local.full_cap
    }
  ]
}

module "view_policies" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "view-policies"
  description = "Policy to view policies"
  rules = [
    {
      description  = "List access to root"
      path         = "sys/policies/acl"
      capabilities = ["list"]
    },
    {
      description  = "Read and List access to policies"
      path         = "sys/policies/acl/*"
      capabilities = ["read", "list"]
    }
  ]
}

module "manage_secret_mounts" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "manage-secret-mounts"
  description = "Policy to manage secret mounts"
  rules = [
    {
      description  = "Full access to secret mounts"
      path         = "sys/mounts"
      capabilities = local.full_cap
    },
    {
      description  = "Full access to each secret mounts"
      path         = "sys/mounts/*"
      capabilities = local.full_cap
    }
  ]
}

module "view_secret_mounts" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "view-secret-mounts"
  description = "Policy to view secret mounts"
  rules = [
    {
      description  = "Read access to secret mount"
      path         = "sys/mounts"
      capabilities = ["read"]
    },
    {
      description  = "Read and List access to secret mounts"
      path         = "sys/mounts/*"
      capabilities = ["read", "list"]
    }
  ]

}

module "manage_auth_mounts" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "manage-auth-mounts"
  description = "Policy to manage auth mounts"
  rules = [
    {
      description  = "Full access to auth mounts"
      path         = "sys/auth"
      capabilities = local.full_cap
    },
    {
      description  = "Full access to each auth mount"
      path         = "sys/auth/*"
      capabilities = local.full_cap
    }
  ]
}

module "view_auth_mounts" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "view-auth-mounts"
  description = "Policy to view auth mounts"
  rules = [
    {
      description  = "Read access to auth mounts"
      path         = "sys/auth"
      capabilities = ["read"]
    },
    {
      description  = "Read and List access to each auth mount"
      path         = "sys/auth/*"
      capabilities = ["read", "list"]
    }
  ]
}

module "manage_auth_methods" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "manage-auth-methods"
  description = "Policy to manage auth methods"
  rules = [
    {
      description  = "Full access to auth methods"
      path         = "auth/*"
      capabilities = local.full_cap
    }
  ]
}

module "view_auth_methods" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "view-auth-methods"
  description = "Policy to view auth methods"
  rules = [
    {
      description  = "Read and List access to each auth methods"
      path         = "auth/*"
      capabilities = ["read", "list"]
    }
  ]
}
