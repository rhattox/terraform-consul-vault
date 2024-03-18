resource "helm_release" "consul" {
  name       = "consul"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  version    = "0.32.1"
  namespace  = "consul"

  set {
    name  = "global.name"
    value = "consul"
  }
}
