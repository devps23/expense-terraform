instance_type = "t3.micro"
env = "dev"
//ssh_user = "ec2-user"
//ssh_pass="DevOps321"
cidr_block = "10.10.0.0/16"
default_vpc_id = "vpc-02a94ee8944923438"
default_vpc_cidr_block = "172.31.0.0/16"
default_route_table_id = "rtb-0a2e9ff93585c96fd"
frontend_subnets = ["10.10.32.0/19","10.10.64.0/19"]
backend_subnets = ["10.10.96.0/19","10.10.128.0/19"]
mysql_subnets = ["10.10.160.0/19","10.10.192.0/19"]

