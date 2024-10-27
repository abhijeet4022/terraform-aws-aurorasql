variable "tags" {}
variable "env" {}
variable "rds_type" {}
variable "app_subnets_cidr" {
  description = "CIDR blocks for application subnets allowed to access Aurora SQL."
}

variable "port" {
  description = "Port number for Aurora SQL (e.g., 3306 for MySQL, 5432 for PostgreSQL)."
}

variable "vpc_id" {
  description = "ID of the VPC for Aurora SQL subnet and security groups."
}

variable "engine_family" {
  description = "Aurora SQL engine family (e.g., aurora-mysql5.7, aurora-postgresql10)."
}

variable "db_subnets" {
  description = "Subnet IDs for Aurora SQL deployment, across Availability Zones."
}

