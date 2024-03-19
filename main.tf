module "consul" {
  source = "./modules/consul/"
}

module "vault" {
  depends_on = [ 
    module.consul
  ]
  source = "./modules/vault/"
}
