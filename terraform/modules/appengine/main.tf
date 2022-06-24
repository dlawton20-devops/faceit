terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "<= 3.49"
    }
  }
}

provider "google" {
  project = var.project
}


resource "google_app_engine_application" "dlapp123" {
  project     = var.project
  location_id = var.location_id
}