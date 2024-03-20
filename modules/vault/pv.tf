resource "kubernetes_persistent_volume" "vault_pv" {
  depends_on = [ 
    kubernetes_storage_class_v1.vault_sc
  ]
  metadata {
    name = "vault-pv"
  }
  spec {
    capacity = {
      storage = "20Gi"
    }
    storage_class_name = "vault-local-storage"
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
        path = "/mnt/vault_pv"
      }
    }
  }
}
