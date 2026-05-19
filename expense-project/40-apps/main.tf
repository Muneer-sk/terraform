module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name

  instance_type = "t3.micro"
  ami = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [ local.mysql_sg_id ]
  subnet_id     = local.public_subnet_id
    create_security_group = false
  tags = {
    Name = "${local.resource_name}-mysql"
  }
}
module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name

  instance_type = "t3.micro"
  ami = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [ local.backend_sg_id ]
  subnet_id     = local.private_subnet_id
    create_security_group = false
  tags = {
    Name = "${local.resource_name}-backend"
  }
}
module "frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name

  instance_type = "t3.micro"
  ami = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [ local.frontend_sg_id ]
  subnet_id     = local.public_subnet_id
    create_security_group = false
  tags = {
    Name = "${local.resource_name}-frontend"
  }
}
module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name

  instance_type = "t3.micro"
  ami = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [ local.ansible_sg_id ]
  subnet_id     = local.public_subnet_id
    create_security_group = false
  tags = {
    Name = "${local.resource_name}-ansible"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.zone.id
  #backend.daws81s.online
  name            = "frontend.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = module.frontend.private_ip
  allow_overwrite = true
}
resource "aws_route53_record" "public" {
  zone_id = data.aws_route53_zone.zone.id
  #backend.daws81s.online
  name            = var.domain_name
  type            = "A"
  ttl             = 1
  records         = module.frontend.public_ip
  allow_overwrite = true
}
resource "aws_route53_record" "backend" {
  zone_id = data.aws_route53_zone.zone.id
  #backend.daws81s.online
  name            = "backend.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = module.backend.private_ip
  allow_overwrite = true
}
resource "aws_route53_record" "mysql" {
  zone_id = data.aws_route53_zone.zone.id
  #backend.daws81s.online
  name            = "mysql.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = module.mysql.private_ip
  allow_overwrite = true
}


