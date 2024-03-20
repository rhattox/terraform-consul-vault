resource "kubernetes_persistent_volume_claim" "vault_pvc" {
 depends_on = [ 
    kubernetes_persistent_volume.vault_pv
  ]
  metadata {
    name = "data-vault-0"
    namespace = "vault"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "20Gi"
      }
    }
    storage_class_name = "vault-local-storage"
    volume_name = "${kubernetes_persistent_volume.vault_pv.metadata.0.name}"
  }
}
