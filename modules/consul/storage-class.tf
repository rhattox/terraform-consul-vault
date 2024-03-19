resource "kubernetes_storage_class_v1" "consul_sc" {
  depends_on = [ 
    null_resource.check_dir_existance
    ]
  metadata {
      name = "consul-local-storage"
  }
  storage_provisioner = "kubernetes.io/no-provisioner"
  reclaim_policy      = "Retain"
  volume_binding_mode = "WaitForFirstConsumer"
}

