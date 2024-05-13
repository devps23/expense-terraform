//module "frontend" {
//  depends_on = [module.backend]
//  source = "./module/app"
//  instance_type = var.instance_type
//  component = "frontend"
//  env = var.env
//}
//module "backend" {
//  depends_on = [module.mysql]
//  source = "./module/app"
//  instance_type = var.instance_type
//  component = "backend"
//  env = var.env
//}
//module "mysql" {
//  source = "./module/app"
//  instance_type = var.instance_type
//  component = "mysql"
//  env = var.env
//}
module "vpc" {
  source = "./module/vpc"
  env = var.env
  vpc_cidr_block = var.cidr_block
  default_vpc_id = var.default_vpc_id
  default_cidr_block = var.default_cidr_block
}