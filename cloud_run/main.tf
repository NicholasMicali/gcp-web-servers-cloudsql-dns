# Deploy two Cloud Run services for web servers

resource "google_cloud_run_service" "web_server_1" {
  name     = var.web_server_1_name
  location = var.region

  template {
    metadata {
      # Annotation to enable Cloud SQL connection
      annotations = {
        "run.googleapis.com/cloudsql-instances" = var.cloud_sql_instance_connection_name
      }
    }
    spec {
      service_account_name = var.service_account_email
      containers {
        image = var.web_server_1_image # Placeholder image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service" "web_server_2" {
  name     = var.web_server_2_name
  location = var.region

  template {
    metadata {
      # Annotation to enable Cloud SQL connection
      annotations = {
        "run.googleapis.com/cloudsql-instances" = var.cloud_sql_instance_connection_name
      }
    }
    spec {
      service_account_name = var.service_account_email
      containers {
        image = var.web_server_2_image # Placeholder image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# IAM: Allow public (allUsers) to invoke each Cloud Run service
resource "google_cloud_run_service_iam_member" "web_server_1_public" {
  service  = google_cloud_run_service.web_server_1.name
  location = google_cloud_run_service.web_server_1.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_cloud_run_service_iam_member" "web_server_2_public" {
  service  = google_cloud_run_service.web_server_2.name
  location = google_cloud_run_service.web_server_2.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# IAM: Grant Cloud SQL Client role to the service account for Cloud Run
resource "google_project_iam_member" "cloud_run_sa_sql_client" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${var.service_account_email}"
}
