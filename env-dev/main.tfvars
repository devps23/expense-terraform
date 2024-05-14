env = "dev"
vpc_cidr_block = "10.10.0.0/24"
subnet_cidr_block = "10.10.0.0/24"
frontend-subnets = ["10.10.0.0/27","10.10.0.32/27"]
backend-subnets = ["10.10.0.64/27","10.10.0.96/27"]
mysql-subnets = ["10.10.0.128/27","10.10.0.160/27"]
//public_subnets = ["10.10.0.192/27","10.10.0.224/27"]
availability_zone = ["us-east-1a","us-east-1b"]