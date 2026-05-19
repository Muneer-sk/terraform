data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/expense/dev/bastion_sg_id"
}
data "aws_ssm_parameter" "databse_subnet_ids" {
  name = "/expense/dev/database_subnet_ids"
}
data "aws_ssm_parameter" "backend_sg_id" {
  name = "/expense/dev/backend_sg_id"
}
data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/expense/dev/private_subnet_ids"
}
data "aws_ssm_parameter" "frontend_sg_id" {
  name = "/expense/dev/frontend_sg_id"
}
data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/expense/dev/public_subnet_ids"
}
data "aws_ssm_parameter" "ansible_sg_id" {
  name = "/expense/dev/ansible_sg_id"
}
data "aws_route53_zone" "zone" {
  name = "mxyz.shop"
}
