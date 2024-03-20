resource "kubernetes_namespace" "vault_ns" {
  metadata {
    name = "vault"
  }
}
