resource "kubernetes_storage_class_v1" "vault_sc" {
  depends_on = [ 
    null_resource.check_dir_existance
    ]
  metadata {
      name = "vault-local-storage"
  }
  storage_provisioner = "kubernetes.io/no-provisioner"
  reclaim_policy      = "Retain"
  volume_binding_mode = "WaitForFirstConsumer"
}

