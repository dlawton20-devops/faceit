variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

resource "random_id" "network_name_suffix" {
  byte_length = 4
}


# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc-${random_id.network_name_suffix.hex}"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
