module "frontend" {
  depends_on = [module.backend]
  source = "./module/app"
  instance_type = var.instance_type
  component = "frontend-1"
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  env = var.env
}
module "backend" {
  depends_on = [module.mysql]
  source = "./module/app"
  instance_type = var.instance_type
  component = "backend-1"
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  env = var.env
}
module "mysql" {
  source = "./module/app"
  instance_type = var.instance_type
  component = "mysql-1"
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  env = var.env
}