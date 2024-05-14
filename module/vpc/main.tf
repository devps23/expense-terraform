resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "vpc-${var.env}-new"
  }
}
resource "aws_subnet" "frontend" {
  count                = length(var.frontend-subnets)
  vpc_id               = aws_vpc.vpc.id
  cidr_block           = var.frontend-subnets[count.index]
  availability_zone    = var.availability_zone[count.index]

  tags = {
    Name = "${var.env}-frontend-subnets-${count.index}"
  }
}
resource "aws_subnet" "backend" {
  count                = length(var.backend-subnets)
  vpc_id               = aws_vpc.vpc.id
  cidr_block           = var.backend-subnets[count.index]
  availability_zone    = var.availability_zone[count.index]

  tags = {
    Name = "${var.env}-backend-subnets-${count.index}"
  }
}
resource "aws_subnet" "db" {
  count                = length(var.db-subnets)
  vpc_id               = aws_vpc.vpc.id
  cidr_block           = var.db-subnets[count.index]
  availability_zone    = var.availability_zone[count.index]

  tags = {
    Name = "${var.env}-db-subnets-${count.index}"
  }
}