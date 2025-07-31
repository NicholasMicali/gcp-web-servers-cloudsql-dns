# DNS Module

This module configures a public Cloud DNS managed zone and creates DNS records to route external traffic to two Cloud Run services.

## Features
- Creates a public managed DNS zone using the `terraform-google-cloud-dns` community module.
- Adds CNAME records pointing to the URLs of two Cloud Run services.
- Outputs DNS zone name, domain, and name servers for delegation or reference.

## Usage
```hcl
module "dns" {
  source                = "./dns"
  project_id            = var.project_id
  zone_name             = "example-com"
  zone_domain           = "example.com."
  web_server_1_dns_name = "app1.example.com."
  web_server_2_dns_name = "app2.example.com."
  web_server_1_url      = module.cloud_run.web_server_1_url
  web_server_2_url      = module.cloud_run.web_server_2_url
}
```

## Inputs
- `project_id`: The GCP project ID where the DNS zone will be created.
- `zone_name`: The DNS zone name (unique within the project).
- `zone_domain`: The DNS zone domain (must end with a period, e.g., `example.com.`).
- `web_server_1_dns_name`: The DNS name for web server 1 (e.g., `app1.example.com.`).
- `web_server_2_dns_name`: The DNS name for web server 2 (e.g., `app2.example.com.`).
- `web_server_1_url`: The Cloud Run URL for web server 1 (should be a valid CNAME target).
- `web_server_2_url`: The Cloud Run URL for web server 2 (should be a valid CNAME target).

## Outputs
- `dns_zone_name`: The DNS zone name.
- `dns_zone_domain`: The DNS zone domain.
- `dns_name_servers`: The DNS zone name servers.

## Requirements
- Google Cloud DNS API enabled
- DNS Admin permissions

## Notes
- Cloud Run custom domains may require domain verification in GCP.
- CNAME records are used to point to the Cloud Run service URLs.
