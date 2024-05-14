env = "dev"
vpc_cidr_block = "10.10.0.0/24"
subnet_cidr_block = "10.10.0.0/24"
//frontend-subnets = ["10.10.0.0/27","10.10.0.32/27"]
//backend-subnets = ["10.10.0.64/27","10.10.0.96/27"]
//db-subnets = ["10.10.0.128/27","10.10.0.160/27"]
availability_zone = ["us-east-1a","us-east-1b"]
frontend-subnets  = ["10.10.0.0/20","10.10.16.0/20"]
backend-subnets   = ["10.10.32.0/20","10.10.48.0/20"]
db-subnets        = ["10.10.64.0/20","10.10.80.0/20"]

