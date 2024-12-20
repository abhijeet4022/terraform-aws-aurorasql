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

# DB Cluster
variable "engine" {
  description = "Database engine for Aurora SQL (e.g., aurora-mysql or aurora-postgresql)."
}

variable "engine_version" {
  description = "Version of the Aurora SQL engine to use (e.g., 5.7.mysql_aurora.2.03.4)."
}

variable "backup_retention_period" {
  description = "Number of days to retain backups for the Aurora SQL cluster."
}

variable "preferred_backup_window" {
  description = "Preferred daily backup window for the Aurora SQL cluster (e.g., 07:00-09:00)."
}

variable "database_name" {
  description = "The name of the default database to be created in the Aurora SQL cluster."
}

variable "master_username" {
  description = "Username for the master user of the Aurora SQL database."
}

variable "master_password" {
  description = "Password for the master user. Must be at least 8 characters."
}

variable "skip_final_snapshot" {
  description = "Boolean flag to skip the final snapshot when deleting the Aurora SQL cluster. Set to true to skip, false to create a snapshot."
}

# Cluster Instance
variable "instance_count" {
  description = "Number of Aurora SQL cluster instances."
}

variable "instance_class" {
  description = "Instance type for Aurora SQL instances (e.g., db.r5.large)."
}

variable "kms_key_id" {
  description = "Provide the KMS KEY ARN"
}