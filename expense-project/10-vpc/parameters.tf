resource "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
  value = module.vpc.vpc_id
  type = "String"
}