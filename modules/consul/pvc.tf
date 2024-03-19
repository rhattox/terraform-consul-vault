resource "kubernetes_persistent_volume_claim" "vault_pvc" {
 depends_on = [ 
    kubernetes_persistent_volume.consul_pv
  ]
  metadata {
    name = "data-consul-consul-server-0"
    namespace = "consul"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    storage_class_name = "consul-local-storage"
    volume_name = "${kubernetes_persistent_volume.consul_pv.metadata.0.name}"
  }
}
