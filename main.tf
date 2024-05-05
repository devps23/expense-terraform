module "frontend" {
  source = "module/app"
  instance_type = var.instance_type
  component = "frontend-1"
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  env = var.env
}