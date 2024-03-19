resource "kubernetes_storage_class_v1" "consul_sc" {
  metadata {
      name = "consul-storage-class"
  }
  storage_provisioner = "kubernetes.io/no-provisioner"
  reclaim_policy      = "Retain"
}

