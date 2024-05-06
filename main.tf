module "frontend" {

  source = "./module/app"
  instance_type = var.instance_type
  component = "frontend"
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  env = var.env
}
module "backend" {

  source = "./module/app"
  instance_type = var.instance_type
  component = "backend"
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  env = var.env
}
module "mysql" {
  source = "./module/app"
  instance_type = var.instance_type
  component = "mysql"
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  env = var.env
}