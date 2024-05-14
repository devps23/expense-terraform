//env = "dev"
//instance_type = "t2.micro"
////ssh_user = "ec2-user"
////ssh_pass="DevOps321"
//vpc_cidr_block = "10.10.0.16/28"
//default_vpc_id = "vpc-02a94ee8944923438"
//default_vpc_cidr_block = "172.31.0.0/16"
//default_route_table_id = "rtb-0a2e9ff93585c96fd"
//frontend-subnets = ["10.10.0.16/28","10.10.0.32/28"]
//availability_zone = ["us-east-1a","us-east-1b"]

env = "dev"
vpc_cidr_block = "10.10.0.0/24"
subnet_cidr_block = "10.10.0.0/24"

frontend-subnets = ["10.10.0.0/27","10.10.0.32/27"]
//backend-subnet = ["10.10.0.64/27","10.10.0.96/27"]
//mysql-subnet = ["10.10.0.128/27","10.10.0.160/27"]
//public_subnets = ["10.10.0.192/27","10.10.0.224/27"]
availability_zone = ["us-east-1a","us-east-1b"]