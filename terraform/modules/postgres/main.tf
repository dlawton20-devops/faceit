resource "google_sql_database_instance" "main" {
  project          = var.project_id
  name             = var.name
  database_version = var.database_version
  region = var.region
  settings {
    tier              = var.tier
  }
}
