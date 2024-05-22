module "frontend" {
  depends_on = [module.backend]
  source = "./module/app"
  instance_type = var.instance_type
  component = "frontend"
  env = var.env
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.db_subnets
  lb_tg_group  = true
  lb_internet_type = "public"
  lb_req = true
  lb_subnets = module.vpc.public_subnets
  app_port = 80
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  bastion_nodes = var.bastion_nodes
  add_sg_app_port_inst = var.public-subnets
  out_sg_app_port_inst = ["0.0.0.0/0"]
}
module "backend" {
  depends_on = [module.mysql]
  source = "./module/app"
  instance_type = var.instance_type
  component = "backend"
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  env = var.env
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.db_subnets
  lb_tg_group = true
  lb_internet_type = "private"
  lb_req = true
  lb_subnets = module.vpc.backend_subnets
  app_port = 8080
  bastion_nodes = var.bastion_nodes
  add_sg_app_port_inst = concat(var.frontend-subnets,var.backend-subnets)
  }
module "mysql" {
  source = "./module/app"
  instance_type = var.instance_type
  component = "mysql"
  env = var.env
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.db_subnets
  ssh_user = var.ssh_user
  ssh_pass = var.ssh_pass
  app_port = 3306
  bastion_nodes = var.bastion_nodes
  add_sg_app_port_inst = var.db-subnets

}
module "vpc" {
  source = "./module/vpc"
  env = var.env
  vpc_cidr_block = var.vpc_cidr_block
  availability_zone = var.availability_zone
  frontend-subnets = var.frontend-subnets
  backend-subnets = var.backend-subnets
  db-subnets =  var.db-subnets
  default_vpc_id = var.default_vpc_id
  default_vpc_cidr = var.default_vpc_cidr
  default_route-table_id = var.default_route-table_id
  public-subnets = var.public-subnets

}