resource "kubernetes_persistent_volume_claim" "vault_pvc" {
  depends_on = [ 
    kubernetes_persistent_volume.vault_pv,
    kubernetes_storage_class_v1.vault_sc
  ]
  metadata {
    name = "vault-pvc"
    namespace = "vault"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    storage_class_name = "vault-storage-class"
    volume_name = "${kubernetes_persistent_volume.vault_pv.metadata.0.name}"
  }
}
