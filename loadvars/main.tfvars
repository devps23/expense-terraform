instance_type = "t3.micro"
env = "dev"
//ssh_user = "ec2-user"
//ssh_pass="DevOps321"
cidr_block = "10.10.0.16/28"
default_vpc_id = "vpc-02a94ee8944923438"
default_vpc_cidr_block = "172.31.0.0/16"
default_route_table_id = "rtb-0a2e9ff93585c96fd"
frontend_subnets = ["10.10.0.32/28","10.10.0.48/28"]
backend_subnets = ["10.10.0.64/28","10.10.0.80/28"]
mysql_subnets = ["10.10.0.96/28","10.10.0.112/28"]

