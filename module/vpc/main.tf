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
//peer connection between two vpc id's
resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = aws_vpc.vpc.id
  vpc_id        = var.default_vpc_id
}
//resource "aws_route" "route" {
//  route_table_id            = aws_vpc.vpc.main_route_table_id
//  destination_cidr_block    = "10.0.1.0/22"
//  vpc_peering_connection_id = "pcx-45ff3dc1"
//}
