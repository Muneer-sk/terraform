module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = local.resource_name

  instance_type = "t3.micro"
  ami = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [ local.bastion_sg_id ]
  subnet_id     = local.public_subnet_id
    create_security_group = false
  tags = {
    Name = local.public_subnet_id
  }
}