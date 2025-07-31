# Outputs for DNS zone and records

output "dns_zone_name" {
  description = "The DNS zone name."
  value       = module.cloud_dns.name
}

output "dns_zone_domain" {
  description = "The DNS zone domain."
  value       = module.cloud_dns.domain
}

output "dns_name_servers" {
  description = "The DNS zone name servers."
  value       = module.cloud_dns.name_servers
}
