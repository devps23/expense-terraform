env = "dev"
instance_type="t3.micro"
vpc_cidr_block = "10.10.0.0/24"
subnet_cidr_block = "10.10.0.0/24"
frontend-subnets = ["10.10.0.0/27","10.10.0.32/27"]
backend-subnets = ["10.10.0.64/27","10.10.0.96/27"]
db-subnets = ["10.10.0.128/27","10.10.0.160/27"]
public-subnets = ["10.10.0.192/27","10.10.0.224/27"]
availability_zone = ["us-east-1a","us-east-1b"]
default_vpc_id = "vpc-02a94ee8944923438"
default_vpc_cidr = "172.31.0.0/16"
default_route-table_id= "rtb-0a2e9ff93585c96fd"
token = "hvs.jUJeWSfOihA8RVtnhx9FbHLi"
certificate_arn =  "arn:aws:acm:us-east-1:633788536644:certificate/274d4c80-dc76-4296-b3ed-d959cbe837ba"

//arn:aws:elasticloadbalancing:us-east-1:041445559784:loadbalancer/app/dev-frontend-lb/9edf66f6a4f32e20
"arn:aws:acm:us-east-1:633788536644:certificate/274d4c80-dc76-4296-b3ed-d959cbe837ba"

//frontend-subnets  = ["10.10.0.0/20","10.10.16.0/20"]
//backend-subnets   = ["10.10.32.0/20","10.10.48.0/20"]
//db-subnets        = ["10.10.64.0/20","10.10.80.0/20"]

