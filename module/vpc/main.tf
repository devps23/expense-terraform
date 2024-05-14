resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "vpc-${var.env}-new"
  }
}
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = aws_vpc.vpc.cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = "subnet-${var.env}-new"
  }
}