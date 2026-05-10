variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"
}
variable "from_port" {
  type    = number
  default = 22
}
variable "to_port" {
  type    = number
  default = 22

}
variable "tags" {
  type = map(string)
  default = {
    Name      = "terraform"
    Project   = "Expense"
    component = "frontend"
  }
}
variable "cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
