resource "helm_release" "vault" {
  depends_on = [ kubernetes_persistent_volume_claim.vault_pvc ]
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  version    = "0.27.0"
  namespace  = "default"

  set {
    name  = "global.enabled"
    value = "true"
  }

  set {
    name  = "dataStorage.storageClass"
    value = "vault-storage-class"
  }


}
