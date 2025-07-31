# Cloud Run Web Servers Module

This module deploys two independent web servers as Google Cloud Run services, each with public access enabled and optional Cloud SQL integration.

## Features
- Two separate Cloud Run services, each with its own container image
- 100% traffic routed to the latest revision
- Public (unauthenticated) access enabled via IAM
- Cloud SQL integration via annotation and IAM
- Outputs the URLs for both services (for DNS or other use)

## Usage Example

```hcl
module "cloud_run_web_servers" {
  source              = "./cloud_run"
  region              = "us-central1"
  web_server_1_image  = "gcr.io/my-project/web-server-1:latest"
  web_server_2_image  = "gcr.io/my-project/web-server-2:latest"
  cloud_sql_instance_connection_name = module.postgres.instance_connection_name
  service_account_email = google_service_account.cloud_run.email
}
```

## Inputs
- `region`: The GCP region for deployment
- `web_server_1_image`: Container image for the first web server
- `web_server_2_image`: Container image for the second web server
- `cloud_sql_instance_connection_name`: The Cloud SQL instance connection name (from Cloud SQL module output)
- `service_account_email`: Service account email for Cloud Run services (must have Cloud SQL Client role)

## Outputs
- `web_server_1_url`: URL of the first Cloud Run service
- `web_server_2_url`: URL of the second Cloud Run service

## Cloud SQL Integration
- The Cloud SQL instance connection name is set as an annotation on each Cloud Run service for automatic connection handling.
- The specified service account is granted the `roles/cloudsql.client` IAM role for secure Cloud SQL access.

## Best Practices
- Use a dedicated service account for Cloud Run with minimal permissions plus `roles/cloudsql.client`.
- Source the Cloud SQL connection name from the Cloud SQL module output.
- Never hard-code secrets; use Secret Manager or CI/CD for sensitive values.
