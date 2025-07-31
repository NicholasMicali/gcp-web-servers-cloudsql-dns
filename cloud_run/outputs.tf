# Output the URLs of both Cloud Run services

output "web_server_1_url" {
  description = "URL of the first Cloud Run web server."
  value       = google_cloud_run_service.web_server_1.status[0].url
}

output "web_server_2_url" {
  description = "URL of the second Cloud Run web server."
  value       = google_cloud_run_service.web_server_2.status[0].url
}
