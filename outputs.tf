# Aggregate key outputs from all modules for easy access

output "cloud_run_web_server_1_url" {
  description = "URL of the first Cloud Run web server."
  value       = module.cloud_run.web_server_1_url
}

output "cloud_run_web_server_2_url" {
  description = "URL of the second Cloud Run web server."
  value       = module.cloud_run.web_server_2_url
}

output "cloud_sql_instance_connection_name" {
  description = "Cloud SQL instance connection name for use in Cloud Run."
  value       = module.postgres.instance_connection_name
}

output "dns_zone_name" {
  description = "The DNS zone name."
  value       = module.dns.dns_zone_name
}

output "dns_zone_domain" {
  description = "The DNS zone domain."
  value       = module.dns.dns_zone_domain
}

output "dns_name_servers" {
  description = "The DNS name servers for the managed zone."
  value       = module.dns.dns_name_servers
}
