module "vpc" {
  source = "git::https://github.com/Muneer-sk/terraform.git//modules/vpc?ref=main"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
}

# resource "aws_vpc_peering_connection" "peer_with_nv_vpc" {
#   count = var.peering_needed
#   vpc_id = module.vpc.vpc_id
#   peer_vpc_id = "vpc-06877294a65fc932d"
#   auto_accept = true
# }

# resource "aws_route" "public_subnet_nv_vpc_peering" {
#   count = var.peering_needed
#   route_table_id = module.vpc.public_route_table_id
#   destination_cidr_block = "172.31.0.0/16"
#   vpc_peering_connection_id = aws_vpc_peering_connection.peer_with_nv_vpc[0].id
# }