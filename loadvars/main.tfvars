instance_type = "t3.micro"
env = "dev"
cidr_block = "10.10.0.16/28"
default_vpc_id = "vpc-02a94ee8944923438"
default_vpc_cidr_block = "172.31.0.0/16"
default_route_table_id = "rtb-0a2e9ff93585c96fd"
frontend-subnets = ["10.10.0.0/27","10.10.0.32/27"]
backend-subnets = ["10.10.0.64/27","10.10.0.96/27"]
mysql-subnets = ["10.10.0.128/27","10.10.0.160/27"]

