module "view_policy" {
  source      = "westelh/policy/vault"
  version     = "0.0.1"
  name        = "auth0-default"
  description = "Auth0 default user policy"
  rules = [
    {
      description  = "List auth methods"
      path         = "sys/auth"
      capabilities = ["read"]
    },
    {
      description  = "Read and List each auth method"
      path         = "auth/*"
      capabilities = ["read", "list"]
    },
    {
      description  = "List all policies"
      path         = "sys/policies/acl"
      capabilities = ["list"]
    },
    {
      description  = "Read each policy"
      path         = "sys/policies/acl/*"
      capabilities = ["read"]
    },
    {
      description  = "List mounts"
      path         = "sys/mounts"
      capabilities = ["read"]
    },
    {
      description  = "Read mount config"
      path         = "sys/mounts/*"
      capabilities = ["read"]
    },
  ]
}

module "auth0" {
  source        = "westelh/auth0-login/vault"
  version       = "0.0.1"
  path          = "auth0"
  domain        = var.auth0_domain
  client_id     = var.auth0_client_id
  client_secret = var.auth0_client_secret
  policies = [
    "default",
    "kubernetes-clusterrole-view",
    "kubernetes-clusterrole-edit",
    "kubernetes-clusterrole-admin",
    "kubernetes-clusterrole-cluster-admin",
    module.view_policy.name,
  ]
  vault_host = var.vault_host
}
