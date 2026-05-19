module "mysql_sg" {
  source = "git::https://github.com/Muneer-sk/terraform.git//modules/security_group?ref=main"
  project_name = var.project_name
  environment = var.environment
  component = var.component
  vpc_id = local.vpc_id
}
module "backend_sg" {
  source = "git::https://github.com/Muneer-sk/terraform.git//modules/security_group?ref=main"
  project_name = var.project_name
  environment = var.environment
  component = "backend"
  vpc_id = local.vpc_id
}
module "frontend_sg" {
  source = "git::https://github.com/Muneer-sk/terraform.git//modules/security_group?ref=main"
  project_name = var.project_name
  environment = var.environment
  component = "frontend"
  vpc_id = local.vpc_id
}
module "bastion_sg" {
  source = "git::https://github.com/Muneer-sk/terraform.git//modules/security_group?ref=main"
  project_name = var.project_name
  environment = var.environment
  component = "bastion"
  vpc_id = local.vpc_id
}
module "ansible_sg" {
  source = "git::https://github.com/Muneer-sk/terraform.git//modules/security_group?ref=main"
  project_name = var.project_name
  environment = var.environment
  component = "ansible"
  vpc_id = local.vpc_id
}


resource "aws_security_group_rule" "mysql_backend" {
  description = "Traffic coming from backend to mysql"
  type = "ingress"
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  security_group_id = module.mysql_sg.id
  source_security_group_id = module.backend_sg.id
  
}
resource "aws_security_group_rule" "mysql_ansible" {
  description = "Traffic coming from ansible to mysql"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = module.mysql_sg.id
  source_security_group_id = module.ansible_sg.id
  
}
resource "aws_security_group_rule" "backend_frontend" {
  description = "Traffic coming from frontend to backend"
  type = "ingress"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  security_group_id = module.backend_sg.id
  source_security_group_id = module.frontend_sg.id
  
}
resource "aws_security_group_rule" "backend_ansible" {
  description = "Traffic coming from ansible to backend"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = module.backend_sg.id
  source_security_group_id = module.ansible_sg.id
  
}
resource "aws_security_group_rule" "frontend_public" {
  description = "Traffic coming from internet to frontend"
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = module.frontend_sg.id
  cidr_blocks = ["0.0.0.0/0"]
  
}
resource "aws_security_group_rule" "frontend_ansible" {
  description = "Traffic coming from backend to frontend"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = module.frontend_sg.id
  source_security_group_id = module.ansible_sg.id
  
}
resource "aws_security_group_rule" "mysql_bastion" {
  description = "Traffic coming from bastion to mysql"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = module.mysql_sg.id
  source_security_group_id = module.bastion_sg.id
  
}
resource "aws_security_group_rule" "backend_bastion" {
  description = "Traffic coming from bastion to backend"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = module.backend_sg.id
  source_security_group_id = module.bastion_sg.id
  
}
resource "aws_security_group_rule" "frontend_bastion" {
  description = "Traffic coming from bastion to frontend"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = module.frontend_sg.id
  source_security_group_id = module.bastion_sg.id
  
}
resource "aws_security_group_rule" "ansible_public" {
  description = "Traffic coming from internet to ansible"
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = module.ansible_sg.id
  cidr_blocks = ["0.0.0.0/0"]
  
}
resource "aws_security_group_rule" "bastion_public" {
  description = "Traffic coming from internet to bastion"
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "tcp"
  security_group_id = module.ansible_sg.id
  cidr_blocks = ["0.0.0.0/0"]
  
}
