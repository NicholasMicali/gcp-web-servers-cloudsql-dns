# Cloud SQL PostgreSQL Module

This module provisions a managed PostgreSQL database using Google Cloud SQL and the community Terraform module `terraform-google-sql-db`.

## Features
- Custom machine tier for large data volumes (default: `db-custom-1-3840`)
- Backups enabled and configurable
- Maintenance window configurable
- Deletion protection disabled for easier management
- IP connectivity configurable for Cloud Run access (public or private)
- Outputs the instance connection name for use in Cloud Run service annotations

## Usage
```hcl
module "postgres" {
  source  = "terraform-google-modules/sql-db/google//modules/postgresql"
  version = "~> 25.2"

  name                 = var.instance_name
  project_id           = var.project_id
  region               = var.region
  database_version     = var.database_version
  tier                 = var.tier
  zone                 = var.zone
  availability_type    = var.availability_type
  deletion_protection  = false

  maintenance_window_day          = var.maintenance_window_day
  maintenance_window_hour         = var.maintenance_window_hour
  maintenance_window_update_track = var.maintenance_window_update_track

  disk_size            = var.disk_size
  disk_type            = var.disk_type
  disk_autoresize      = true

  backup_configuration = {
    enabled     = true
    start_time  = var.backup_start_time
    retained_backups = var.retained_backups
    retention_unit   = var.retention_unit
  }

  ip_configuration = {
    ipv4_enabled = var.ipv4_enabled
    ssl_mode     = var.ssl_mode
    private_network = var.private_network
    authorized_networks = var.authorized_networks
  }

  db_name      = var.db_name
  db_charset   = var.db_charset
  db_collation = var.db_collation

  user_name     = var.user_name
  user_password = var.user_password
}
```

## Inputs
See `variables.tf` for all configurable inputs.

## Outputs
- `instance_connection_name`: The connection name for use in Cloud Run service annotations.

## Best Practices
- Use a strong password for `user_password`, ideally sourced from a secret manager or CI/CD pipeline.
- For production, consider using private IP connectivity and restricting authorized networks.
- Adjust `tier`, `disk_size`, and `availability_type` for your workload and HA requirements.
