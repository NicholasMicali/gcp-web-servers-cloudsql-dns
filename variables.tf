# Root input variables for project-wide configuration

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region to deploy resources."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone for the Cloud SQL instance."
  type        = string
  default     = "us-central1-a"
}

# Cloud Run web server names and images
variable "web_server_1_name" {
  description = "Name for the first Cloud Run service."
  type        = string
  default     = "web-server-1"
}

variable "web_server_2_name" {
  description = "Name for the second Cloud Run service."
  type        = string
  default     = "web-server-2"
}

variable "web_server_1_image" {
  description = "Container image for the first web server."
  type        = string
  default     = "gcr.io/cloudrun/hello"
}

variable "web_server_2_image" {
  description = "Container image for the second web server."
  type        = string
  default     = "gcr.io/cloudrun/hello"
}

# Cloud SQL configuration
variable "cloud_sql_instance_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
  default     = "postgres-instance"
}

variable "db_name" {
  description = "Default database name."
  type        = string
  default     = "appdb"
}

variable "db_user" {
  description = "Default database user name."
  type        = string
  default     = "appuser"
}

variable "db_password" {
  description = "Default database user password. Should be set via secret or CI/CD."
  type        = string
  sensitive   = true
}

# DNS configuration
variable "zone_name" {
  description = "The DNS zone name (must be unique within the project)."
  type        = string
}

variable "zone_domain" {
  description = "The DNS zone domain (must end with a period, e.g., 'example.com.')."
  type        = string
}

variable "web_server_1_dns_name" {
  description = "The DNS name for web server 1 (e.g., 'app1.example.com.')."
  type        = string
}

variable "web_server_2_dns_name" {
  description = "The DNS name for web server 2 (e.g., 'app2.example.com.')."
  type        = string
}

# Service account for Cloud Run
variable "cloud_run_service_account_email" {
  description = "Service account email for Cloud Run services (must have Cloud SQL Client role)."
  type        = string
}

