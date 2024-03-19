resource "kubernetes_storage_class_v1" "vault_sc" {
  metadata {
    name = "vault-storage-class"
  }
  storage_provisioner = "kubernetes.io/no-provisioner"
  reclaim_policy      = "Retain"
}

