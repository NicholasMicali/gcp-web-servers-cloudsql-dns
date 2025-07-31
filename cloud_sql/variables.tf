// Variables for Cloud SQL PostgreSQL module
variable "instance_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
}

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region for the Cloud SQL instance."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone for the Cloud SQL instance."
  type        = string
  default     = null
}

variable "database_version" {
  description = "The PostgreSQL version to use (e.g., POSTGRES_14)."
  type        = string
  default     = "POSTGRES_14"
}

variable "tier" {
  description = "The machine tier (e.g., db-custom-1-3840 or higher for large data volumes)."
  type        = string
  default     = "db-custom-1-3840"
}

variable "availability_type" {
  description = "The availability type: ZONAL or REGIONAL."
  type        = string
  default     = "REGIONAL"
}

variable "maintenance_window_day" {
  description = "Day of week (1-7) for maintenance window."
  type        = number
  default     = 7
}

variable "maintenance_window_hour" {
  description = "Hour of day (0-23) for maintenance window."
  type        = number
  default     = 2
}

variable "maintenance_window_update_track" {
  description = "Maintenance window update track (canary or stable)."
  type        = string
  default     = "stable"
}

variable "disk_size" {
  description = "Disk size in GB."
  type        = number
  default     = 100
}

variable "disk_type" {
  description = "Disk type (PD_SSD or PD_HDD)."
  type        = string
  default     = "PD_SSD"
}

variable "backup_start_time" {
  description = "Backup start time in UTC (HH:MM, 24hr format)."
  type        = string
  default     = "03:00"
}

variable "retained_backups" {
  description = "Number of retained backups."
  type        = number
  default     = 7
}

variable "retention_unit" {
  description = "Backup retention unit (COUNT or DAYS)."
  type        = string
  default     = "COUNT"
}

variable "ipv4_enabled" {
  description = "Enable public IPv4. Set to true if Cloud Run needs public access."
  type        = bool
  default     = true
}

variable "ssl_mode" {
  description = "SSL mode for connections (ENCRYPTED_ONLY or ALLOW_UNENCRYPTED_AND_ENCRYPTED)."
  type        = string
  default     = "ENCRYPTED_ONLY"
}

variable "private_network" {
  description = "VPC network self-link for private IP connectivity. Null for public."
  type        = string
  default     = null
}

variable "authorized_networks" {
  description = "List of authorized networks for public IP access. Each item is a map with keys 'name' and 'value' (CIDR)."
  type        = list(map(string))
  default     = []
}

variable "db_name" {
  description = "Default database name."
  type        = string
  default     = "appdb"
}

variable "db_charset" {
  description = "Database charset."
  type        = string
  default     = "UTF8"
}

variable "db_collation" {
  description = "Database collation."
  type        = string
  default     = "en_US.UTF8"
}

variable "user_name" {
  description = "Default database user name."
  type        = string
  default     = "appuser"
}

variable "user_password" {
  description = "Default database user password. Should be set via secret or CI/CD."
  type        = string
  sensitive   = true
}
