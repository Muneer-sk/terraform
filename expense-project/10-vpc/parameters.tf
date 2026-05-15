resource "aws_ssm_parameter" "vpc_id" {
  name = "/expense/dev/vpc_id"
  value = module.vpc.vpc_id
  type = "String"
}