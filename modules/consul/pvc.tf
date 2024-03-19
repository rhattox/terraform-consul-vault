resource "kubernetes_persistent_volume_claim" "consul_pvc" {
  depends_on = [ 
    kubernetes_persistent_volume.consul_pv,
    kubernetes_storage_class_v1.consul_sc
  ]
  metadata {
    name = "consul-pvc"
    namespace = "consul"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    storage_class_name = "consul-storage-class"
    volume_name = "${kubernetes_persistent_volume.consul_pv.metadata.0.name}"
  }
}
