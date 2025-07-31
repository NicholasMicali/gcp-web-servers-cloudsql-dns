// cloud_sql/main.tf
// Provision a Cloud SQL PostgreSQL instance using the community module

module "postgres" {
  source  = "terraform-google-modules/sql-db/google//modules/postgresql"
  version = "~> 12.0"  # Updated to use module supporting Google Provider >= 4.x & < 7.x

  project_id           = var.project_id
  name                 = var.cloud_sql_instance_name
  region               = var.region
  database_version     = "POSTGRES_14"
  tier                 = var.tier
  disk_size            = var.disk_size
  disk_type            = var.disk_type
  deletion_protection  = var.deletion_protection
  maintenance_window_day          = var.maintenance_window_day
  maintenance_window_hour         = var.maintenance_window_hour
  maintenance_window_update_track = var.maintenance_window_update_track
  backup_configuration = var.backup_configuration
  user_name            = var.db_user
  user_password        = var.db_password
  db_name              = var.db_name
  ip_configuration     = var.ip_configuration
}

// Output the instance connection name for Cloud Run integration
output "instance_connection_name" {
  description = "The connection name of the Cloud SQL instance."
  value       = module.postgres.instance_connection_name
}
