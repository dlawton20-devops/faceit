variable "location_id" {
    default = "europe-west2"
}
variable "project" {
    default = "faceitdltest"
}
variable "database_version" {
    default = "POSTGRES_14"
}

variable "name" {
    default = "faceittest"
}
variable "zone" {
    default = "europe-west2"
}
variable "location" {
    default = "europe-west2"
}

# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}

# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}
# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
}
