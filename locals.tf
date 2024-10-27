locals {
  tags        = merge(var.tags, { module-name = "aurorasql" }, { env = var.env })
  name_prefix = "${var.env}-${var.rds_type}-rds"
}



