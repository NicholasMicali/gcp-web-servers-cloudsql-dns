# Input variables for the DNS module

variable "project_id" {
  description = "The GCP project ID where the DNS zone will be created."
  type        = string
}

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

variable "web_server_1_url" {
  description = "The Cloud Run URL for web server 1 (should be a valid CNAME target)."
  type        = string
}

variable "web_server_2_url" {
  description = "The Cloud Run URL for web server 2 (should be a valid CNAME target)."
  type        = string
}
