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
resource "aws_subnet" "db_subnets" {
  count                = length(var.db-subnets)
  vpc_id               = aws_vpc.vpc.id
  cidr_block           = var.db-subnets[count.index]
  availability_zone    = var.availability_zone[count.index]

  tags = {
    Name = "${var.env}-db-subnets-${count.index}"
  }
}
resource "aws_subnet" "public_subnets" {
  count                = length(var.public-subnets)
  vpc_id               = aws_vpc.vpc.id
  cidr_block           = var.public-subnets[count.index]
  availability_zone    = var.availability_zone[count.index]

  tags = {
    Name = "${var.env}-public-subnets-${count.index}"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "ig"
  }
}
resource "aws_route_table" "frontend_route" {
  count = length(var.frontend-subnets)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.default_vpc_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  }
  tags = {
    Name = "${var.component}-rt-${count.index}"
  }
}
resource "aws_route_table" "backend_route" {
  count = length(var.backend-subnets)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.default_vpc_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  }
  tags = {
    Name = "${var.component}-rt-${count.index}"
  }
}
resource "aws_route_table" "db_route" {
  count = length(var.db-subnets)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.default_vpc_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  }
  tags = {
    Name = "${var.component}-rt-${count.index}"
  }
}
resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id = var.default_vpc_id
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "peer-${var.env}-new"
  }
}

//resource "aws_route" "entry_route"{
//    route_table_id            = aws_vpc.vpc.main_route_table_id
//    destination_cidr_block    = var.default_vpc_cidr
//   vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
//
//}
//resource "aws_route" "entry_route_default"{
//  route_table_id            = var.default_route-table_id
//  destination_cidr_block    = aws_vpc.vpc.cidr_block
//  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

//}

