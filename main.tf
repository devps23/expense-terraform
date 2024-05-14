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
module "mysql" {
  source = "./module/app"
  instance_type = var.instance_type
  component = "mysql"
  env = var.env
  vpc = module.vpc.vpc_id
  subnets = module.vpc.db_subnets
}
module "vpc" {
  source = "./module/vpc"
  env = var.env
  instance_type= var.instance_type
  vpc_cidr_block = var.vpc_cidr_block
  availability_zone = var.availability_zone
  frontend-subnets = var.frontend-subnets
  backend-subnets = var.backend-subnets
  db-subnets =  var.db-subnets
  default_vpc_id = var.default_vpc_id
  default_vpc_cidr = var.default_vpc_cidr
  default_route-table_id = var.default_route-table_id

}