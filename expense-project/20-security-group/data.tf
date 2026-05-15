data "aws_ssm_parameters" "vpc_id" {
    name = "/${var.project_name}/${var.environment}/vpc_id"
}