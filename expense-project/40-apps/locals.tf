locals {
    resource_name = "${var.project_name}-${var.environment}"
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
    databse_subnet_id = split(",", data.aws_ssm_parameter.databse_subnet_ids.value)[0]
    # subnet-1,subnet-2 value need to convert into listof strings ex: "subnet-1", "subnet-2"
    backend_sg_id = data.aws_ssm_parameter.backend_sg_id.value
    private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
    frontend_sg_id = data.aws_ssm_parameter.frontend_sg_id.value
    public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
    ansible_sg_id = data.aws_ssm_parameter.ansible_sg_id.value
}