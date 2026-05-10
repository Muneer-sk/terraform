variable "cidr_block" {
  
}
variable "enable_dns_hostnames" {
  type = bool
  default = true
}
variable "vpc_tags" {
  default = {}
}
variable "common_tags" {
  default = {}
}
variable "project_name" {
  type = string
}
variable "environment" {
  type = string
}
variable "public_subnet_cidrs" {
  type = list(string)
  validation {
    condition = length(var.public_subnet_cidrs) == 2
    error_message = "Please enter the 2 valid public subnet CIDR ranges"
  }
}
variable "public_cidr_tags" {
  default = {}
}