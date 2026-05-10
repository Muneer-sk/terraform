variable "ami_id" {
  
}
variable "instance_type" {
    default = "t3.micro"
    validation {
      condition = var.instance_type == "t3.micro"
      error_message = "Condition: Only aceptable t3.micro instance only"
    }
  
}
variable "subnet_id" {
  
}
variable "sg_id" {
  
}
variable "ec2-name" {
  
}