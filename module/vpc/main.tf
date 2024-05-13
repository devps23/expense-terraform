//to create custom VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "vpc-${var.env}-new"
  }
}
// to create subnet in vpc
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "subnet-${var.env}-new"
  }
}
