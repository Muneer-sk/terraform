locals {
    resource_name = "${var.project_name}-${var.environment}-${var.component}"
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
    # subnet-1,subnet-2 value need to convert into listof strings ex: "subnet-1", "subnet-2"
}