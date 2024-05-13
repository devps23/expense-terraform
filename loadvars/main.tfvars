instance_type = "t3.micro"
env = "dev"
vpc_cidr_block = "10.10.0.16/28"
default_vpc_id = "vpc-02a94ee8944923438"
default_vpc_cidr_block = "172.31.0.0/16"
default_route_table_id = "rtb-0a2e9ff93585c96fd"
frontend-subnets = ["10.20.0.0/19","10.20.32.0/19"]
backend-subnets = ["10.20.64.0/19","10.20.128.0/19"]
mysql-subnets = ["10.20.160.0/19","10.20.192.0/19"]

