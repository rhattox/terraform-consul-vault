resource "kubernetes_namespace" "vault_ns" {
  depends_on = [ 
    null_resource.check_dir_existance
  ]   
  metadata {
    name = "vault"
  }
}
