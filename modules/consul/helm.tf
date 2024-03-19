resource "helm_release" "consul" {
  depends_on = [ kubernetes_persistent_volume_claim.consul_pvc ]
  name       = "consul"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  version    = "1.4.0"
  namespace  = "consul"
  create_namespace = true
  
  set {
    name  = "global.name"
    value = "consul"
  }
  set {
    name  = "server.storageClass"
    value = "consul-storage-class"
  }

}
