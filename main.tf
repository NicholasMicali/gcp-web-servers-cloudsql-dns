# Root Terraform configuration to orchestrate Cloud Run, Cloud SQL, and DNS modules

module "postgres" {
  source        = "./cloud_sql"
  project_id    = var.project_id
  region        = var.region
  instance_name = var.cloud_sql_instance_name
  db_name       = var.db_name
  user_name     = var.db_user
  user_password = var.db_password
  # Add more variables as needed for customization
}

module "cloud_run" {
  source                             = "./cloud_run"
  region                             = var.region
  web_server_1_name                  = var.web_server_1_name
  web_server_2_name                  = var.web_server_2_name
  web_server_1_image                 = var.web_server_1_image
  web_server_2_image                 = var.web_server_2_image
  cloud_sql_instance_connection_name = module.postgres.instance_connection_name
  service_account_email              = var.cloud_run_service_account_email
}

module "dns" {
  source                = "./dns"
  project_id            = var.project_id
  zone_name             = var.zone_name
  zone_domain           = var.zone_domain
  web_server_1_dns_name = var.web_server_1_dns_name
  web_server_2_dns_name = var.web_server_2_dns_name
  web_server_1_url      = module.cloud_run.web_server_1_url
  web_server_2_url      = module.cloud_run.web_server_2_url
}
