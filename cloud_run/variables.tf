# Variables for Cloud Run web servers

variable "region" {
  description = "The region to deploy Cloud Run services."
  type        = string
}

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

variable "cloud_sql_instance_connection_name" {
  description = "The Cloud SQL instance connection name (project:region:instance) for annotation."
  type        = string
}

variable "service_account_email" {
  description = "Service account email for Cloud Run services (must have Cloud SQL Client role)."
  type        = string
}
