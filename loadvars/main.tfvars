instance_type = "t3.micro"
env = "dev"
vpc_cidr_block = "10.10.0.16/28"
default_vpc_id = "vpc-02a94ee8944923438"
default_vpc_cidr_block = "172.31.0.0/16"
default_route_table_id = "rtb-0a2e9ff93585c96fd"
frontend-subnets = ["192.168.32.0/20","192.168.48.0/20"]
backend-subnets = ["192.168.64.0/20","192.168.80.0/20"]
mysql-subnets = ["192.168.96.0/20","192.168.112.0/20"]

