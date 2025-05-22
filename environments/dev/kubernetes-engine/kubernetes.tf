module "kubernetes_engine" {
  source            = "westelh/kubernetes-secret-engine/vault"
  version           = "1.0.0"
  description       = "Kubernetes Secret Engine"
  roles             = {}
  cluster_roles = {
    "admin" = ["default"]
    "view" = ["default"]
    "edit" = ["default"]
    "cluster-admin" = ["default"]
  }
  extra_annotations = {}
  extra_labels      = {}
}
