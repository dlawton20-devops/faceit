resource "random_id" "db_name_suffix" {
  byte_length = 4
}
resource "google_sql_database_instance" "database" {
  project = var.project
  name             = "private-instance-${random_id.db_name_suffix.hex}"
  region           = var.location_id
  database_version = var.database_version
  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = true
      private_network = google_compute_network.private_network.id
    }
  }
}

resource "google_sql_user" "users" {
project = var.project
name = "postgrestest"
instance = "private-instance-${random_id.db_name_suffix.hex}"
host = "%"
password = "mysecretpassword"
}

resource "google_compute_network" "private_network" {
  provider = google-beta

  name = "${var.project_id}-vpc"
  project = var.project
}

resource "google_compute_global_address" "private_ip_address" {
  provider = google-beta

  name          = "private-ip-address"
  project = var.project
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.private_network.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  provider = google-beta

  network                 = google_compute_network.private_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}














