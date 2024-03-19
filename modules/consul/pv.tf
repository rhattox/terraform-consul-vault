resource "kubernetes_persistent_volume" "consul_pv" {
  depends_on = [ 
    kubernetes_storage_class_v1.consul_sc
  ]
  metadata {
    name = "consul-pv"
  }
  spec {
    capacity = {
      storage = "20Gi"
    }
    storage_class_name = "consul-local-storage"
    access_modes = ["ReadWriteMany"]
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key = "kubernetes.io/hostname"
            operator = "In"
            values = ["dev-nitro-an515-43"]
          }
        }
      }
    }
    persistent_volume_source {
      local {
        path = "/mnt/consul_pv"
      }
    }
  }
}
