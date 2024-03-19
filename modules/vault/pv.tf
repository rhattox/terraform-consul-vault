resource "kubernetes_persistent_volume" "vault_pv" {
  depends_on = [ null_resource.check_dir_existance ]
  metadata {
    name = "vault-pv"
  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      vsphere_volume {
        volume_path = "/mnt/vault_pv"
      }
    }
  }
}
