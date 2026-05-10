module "ec2" {
  source = "../../modules/ec2"
  ami_id = "ami-0220d79f3f480ecf5"
  subnet_id = "subnet-03f6a20a70a34abc8"
  sg_id = "sg-0670763c62c77ba9b"
  ec2-name = "demo-ec2"
}