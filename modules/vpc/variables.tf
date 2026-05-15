variable "vpc_cidr" {
  
}
variable "enable_dns_hostnames" {
  type = bool
  default = true
}
variable "vpc_tags" {
  default = {}
}
variable "common_tags" {
  default = {
    terraform = true
  
  }
}
variable "project_name" {
  type = string
  default = "project"
}
variable "environment" {
  type = string
  default = "dev"
}
variable "igw_tags" {
  default = {}
}
variable "public_subnet_cidrs" {
  type = list(string)
  validation {
    condition = length(var.public_subnet_cidrs) == 2
    error_message = "Condition: Please enter the 2 valid public subnet CIDR ranges"
  }
  
}
variable "public_subnet_tags" {
default = {}
}
variable "private_subnet_cidrs" {
 type = list(string)
  validation {
    condition = length(var.private_subnet_cidrs) == 2
    error_message = "Condition: Please enter the 2 valid private subnet CIDR ranges"
  }
}
variable "private_subnet-tags" {
  default = {}
}
variable "database_subnet_cidrs" {
 type = list(string)
  validation {
    condition = length(var.database_subnet_cidrs) == 2
    error_message = "Condition: Please enter the 2 valid database subnet CIDR ranges"
  }
}
variable "database_subnet-tags" {
  default = {}
}
