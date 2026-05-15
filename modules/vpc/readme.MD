
# VPC Terraform Module

## Overview

This Terraform module provisions a **highly available VPC architecture** using the **first two Availability Zones (AZs)** in a region. It creates public, private, and database subnets along with required networking components such as an Internet Gateway, NAT Gateway, route tables, and optional VPC peering.

---

## Resources Created

### Networking Core
- VPC
- Internet Gateway (associated with the VPC)
- Elastic IP (EIP)
- NAT Gateway

### Subnets (Across 2 AZs for High Availability)
- 2 Public Subnets
- 2 Private Subnets
- 2 Database Subnets

### Routing
- Public Route Table
- Private Route Table
- Database Route Table
- Routes
- Route table associations with all subnets

### Database
- Database Subnet Group

### VPC Peering (Optional)
- Peering connection with default VPC (if required)
- Peering routes in:
  - Requestor route tables
  - Acceptor route tables

---

## Input Variables

### Mandatory Inputs

| Variable Name | Description |
|--------------|------------|
| `project_name` | Name of the project |
| `environment` | Environment name (e.g., `dev`, `qa`, `prod`) |
| `vpc_cidr` | CIDR block for the VPC |
| `public_subnet_cidrs` | List of **exactly 2** valid public subnet CIDR blocks |
| `private_subnet_cidrs` | List of **exactly 2** valid private subnet CIDR blocks |
| `database_subnet_cidrs` | List of **exactly 2** valid database subnet CIDR blocks |

---

### Optional Inputs

| Variable Name | Default | Description |
|--------------|---------|-------------|
| `enable_dns_hostnames` | `true` | Enable DNS hostnames in the VPC |
| `common_tags` | `{}` | Common tags applied to all resources (`map(string)`) |
| `vpc_tags` | `{}` | Tags specific to the VPC |
| `igw_tags` | `{}` | Tags for the Internet Gateway |
| `public_subnet_tags` | `{}` | Tags for public subnets |
| `private_subnet_tags` | `{}` | Tags for private subnets |
| `database_subnet_tags` | `{}` | Tags for database subnets |
| `db_subnet_group_tags` | `{}` | Tags for the database subnet group |
| `nat_gateway_tags` | `{}` | Tags for the NAT Gateway |
| `public_route_table_tags` | `{}` | Tags for the public route table |
| `private_route_table_tags` | `{}` | Tags for the private route table |
| `database_route_table_tags` | `{}` | Tags for the database route table |

---

## Outputs

| Output Name | Description |
|------------|-------------|
| `vpc_id` | ID of the created VPC |
| `public_subnet_ids` | List of 2 created public subnet IDs |
| `private_subnet_ids` | List of 2 created private subnet IDs |
| `database_subnet_ids` | List of 2 created database subnet IDs |
