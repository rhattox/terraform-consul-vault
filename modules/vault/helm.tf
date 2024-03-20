resource "helm_release" "vault" {
  depends_on = [ kubernetes_namespace.vault_ns ]
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.27.0"
  namespace  = "vault"
  
  values = [file("${path.module}/config.yaml")]
}
