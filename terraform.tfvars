# terraform.tfvars - Example values for required variables
# NOTE: Replace these with your actual project and environment values before running Terraform.

# GCP project ID (must exist)
project_id = "your-gcp-project-id" # <-- Set your GCP project ID here

# GCP region for all resources
region = "us-central1" # Default region; change if needed
zone = "us-central1-a" # Zone for Cloud SQL instance

# Cloud Run service names
web_server_1_name = "web-server-1" # Name for Cloud Run service 1
web_server_2_name = "web-server-2" # Name for Cloud Run service 2

# Container images for Cloud Run services
web_server_1_image = "gcr.io/cloudrun/hello" # Replace with your own image if needed
web_server_2_image = "gcr.io/cloudrun/hello" # Replace with your own image if needed

# Cloud SQL instance settings
cloud_sql_instance_name = "postgres-instance" # Name for Cloud SQL instance
db_name                = "appdb" # Default database name
db_user                = "appuser" # Default database user
# IMPORTANT: Set db_password securely (do not commit secrets to version control)
db_password            = "REPLACE_ME_WITH_A_SECURE_PASSWORD" # <-- Set via secret/CI/CD in production

# DNS zone configuration
zone_name              = "my-zone" # Unique DNS zone name
zone_domain            = "example.com." # DNS zone domain (must end with a period)
web_server_1_dns_name  = "app1.example.com." # DNS name for web server 1
web_server_2_dns_name  = "app2.example.com." # DNS name for web server 2

# Cloud Run service account (must have Cloud SQL Client role)
cloud_run_service_account_email = "my-cloud-run-sa@your-gcp-project-id.iam.gserviceaccount.com" # <-- Set your service account email
