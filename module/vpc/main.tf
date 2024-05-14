resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "vpc-${var.env}-new"
  }
}
resource "aws_subnet" "frontend" {
  count             = length(var.frontend-subnets)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.frontend-subnets[count.index]
  availability_zone = var.availability_zone[count.index]
  tags = {
    Name = "subnet-${var.env}-new-${count.index}"
  }
}