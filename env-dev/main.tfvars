env = "dev"
instance_type = "t2.micro"
//ssh_user = "ec2-user"
//ssh_pass="DevOps321"
vpc_cidr_block = "10.10.0.16/28"
default_vpc_id = "vpc-02a94ee8944923438"
default_vpc_cidr_block = "172.31.0.0/16"
default_route_table_id = "rtb-0a2e9ff93585c96fd"
frontend-subnets = ["10.10.0.16/28","10.10.0.32/28"]
availability_zone = ["us-east-1a","us-east-1b"]