# Aurora SQL DB subnet group.
resource "aws_db_subnet_group" "main" {
  name       = "${local.name_prefix}-subnet-group"
  subnet_ids = var.db_subnets
  tags       = merge(var.tags, { Name = "${local.name_prefix}-subnet-group" })
}


# Parameter Group
resource "aws_db_parameter_group" "main" {
  name   = "${local.name_prefix}-pg"
  family = var.engine_family
  tags        = merge(local.tags, { Name = "${local.name_prefix}-pg" })
}


# SG for Aurora SQL.
resource "aws_security_group" "aurora_sg" {
  name        = "${local.name_prefix}-sg"
  description = "${local.name_prefix}-sg"
  vpc_id      = var.vpc_id
  tags        = merge(var.tags, { Name = "${local.name_prefix}-sg" })
}


# Ingress rule for Aurora SQL.
resource "aws_vpc_security_group_ingress_rule" "ingress" {
  for_each          = toset(var.app_subnets_cidr) # Convert list to a set to iterate over each CIDR
  description       = "Allow inbound TCP on Aurora SQL port 27017 from App Subnets"
  security_group_id = aws_security_group.aurora_sg.id
  cidr_ipv4         = each.value # Each CIDR block as a separate rule
  from_port         = var.port
  to_port           = var.port
  ip_protocol       = "tcp"
  tags              = { Name = "App-to-AuroraSQL-${var.port}-${each.value}" }
}


# Egress rule for Aurora SQL.
resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.aurora_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


# Aurora SQL Cluster
resource "aws_rds_cluster" "main" {
  cluster_identifier      = "${local.name_prefix}-cluster"
  engine                  = var.engine
  engine_version          = var.engine_version
  db_subnet_group_name    = aws_db_subnet_group.main.name
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "must_be_eight_characters"
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
}

