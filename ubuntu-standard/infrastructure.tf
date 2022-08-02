module "worker" {
  source       = "../modules/infrastructure"
  env_name     = "webserver"
  vm_count     = 1
  vm_mem       = 2048
  vm_size      = "6G"
  pmx_template = "tpl-ul22.04-latest"
}
