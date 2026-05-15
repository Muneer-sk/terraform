module "mysql_sg" {
  source = "../../modules/security_group"
  project_name = var.project_name
  environment = var.environment
  component = var.component
  vpc_id = 
}