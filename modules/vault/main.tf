resource "helm_release" "vault" {
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.14.0"
  namespace  = "default"

  set {
    name  = "global.enabled"
    value = "true"
  }
}
