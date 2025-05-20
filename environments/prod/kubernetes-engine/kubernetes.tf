module "kubernetes_engine" {
  source            = "westelh/kubernetes-secret-engine/vault"
  version           = "0.0.2"
  description       = "Kubernetes Secret Engine"
  roles             = {}
  extra_annotations = {}
  extra_labels      = {}
}
