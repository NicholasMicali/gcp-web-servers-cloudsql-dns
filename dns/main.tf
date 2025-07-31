// Configure Cloud DNS managed zone and records for Cloud Run services

module "cloud_dns" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "5.1.0"  # Update to work with Google Provider 4.x to 7.x

  project_id = var.project_id
  name       = var.zone_name
  domain     = var.zone_domain
  type       = "public"

  // Create CNAME records for each Cloud Run service
  recordsets = [
    {
      name    = var.web_server_1_dns_name
      type    = "CNAME"
      ttl     = 300
      records = [replace(var.web_server_1_url, "https://", "")]
    },
    {
      name    = var.web_server_2_dns_name
      type    = "CNAME"
      ttl     = 300
      records = [replace(var.web_server_2_url, "https://", "")]
    }
  ]
}
