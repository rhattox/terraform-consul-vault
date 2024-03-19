resource "kubernetes_namespace" "consul_ns" {
  depends_on = [
    null_resource.check_dir_existance
  ]
  metadata {
    name = "consul"
  }
}
