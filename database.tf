resource "aws_db_subnet_group" "main" {
  name       = "halden-${var.environment}"
  subnet_ids = aws_subnet.private[*].id
}

resource "aws_db_instance" "shipments" {
  identifier                   = "halden-${var.environment}-shipments"
  engine                       = "postgres"
  engine_version               = "16.4"
  instance_class               = var.db_instance_class
  allocated_storage            = 50
  max_allocated_storage        = 200
  db_name                      = "shipments"
  username                     = "halden_admin"
  manage_master_user_password  = true
  db_subnet_group_name         = aws_db_subnet_group.main.name
  vpc_security_group_ids       = [aws_security_group.db.id]
  publicly_accessible          = false
  storage_encrypted            = true
  backup_retention_period      = 14
  deletion_protection          = true
  performance_insights_enabled = true
  skip_final_snapshot          = false
  final_snapshot_identifier    = "halden-${var.environment}-shipments-final"
}
