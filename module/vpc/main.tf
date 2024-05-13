//to create custom VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "vpc-${var.env}-new"
  }
}
//to create two subnets in vpc
//to loop two times use count
//two cidr_blocks(subnets)
resource "aws_subnet" "frontend" {
  count      = length(var.frontend_subnets)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.vpc_cidr_block[count.index+1]

  tags = {
    Name = "subnet-${var.env}-${count.index}-new"
  }
}
// to create subnet in vpc
//single subnet
//resource "aws_subnet" "subnet" {
//  vpc_id     = aws_vpc.vpc.id
//  cidr_block = var.vpc_cidr_block
//
//  tags = {
//    Name = "subnet-${var.env}-new"
//  }
//}
//peer connection between two vpc id's
resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = aws_vpc.vpc.id
  vpc_id        = var.default_vpc_id
  tags = {
    Name = "peer-${var.env}-new"
  }
}
// peer connection for new routetable
//resource "aws_route" "route" {
//  route_table_id            = aws_vpc.vpc.main_route_table_id
//  destination_cidr_block    = var.default_vpc_cidr_block
//  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
//}
//resource "aws_route" "route_default" {
//  route_table_id            = var.default_route_table_id
//  destination_cidr_block    = aws_vpc.vpc.cidr_block
//  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
//}
