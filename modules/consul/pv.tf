resource "kubernetes_persistent_volume" "consul_pv" {
    depends_on = [ null_resource.check_dir_existance ]
  metadata {
    name = "consul-pv"
  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      vsphere_volume {
        volume_path = "/mnt/consul_pv"
      }
    }
  }
}
