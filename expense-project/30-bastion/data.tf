data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/expense/dev/bastion_sg_id"
}
data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/expense/dev/public_subnet_ids"
}