resource "aws_instance" "varibale_ref" {

  ami             = var.ami_id
  instance_type   = var.env == "prod" ? "t3.micro" : "t3.small"
  subnet_id       = "subnet-03f6a20a70a34abc8"
  security_groups = [aws_security_group.terraform_sg.id]
  tags            = var.tags
}
resource "aws_security_group" "terraform_sg" {
  vpc_id = "vpc-06877294a65fc932d"
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }
  tags = var.tags
}