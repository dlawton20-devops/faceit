terraform {
  backend "gcs" {
  }
}


module "appengine_app" {
  source = "./modules/appengine"
  project     = "dl-project-354114"
  location_id = "europe-west2"
}

module "postgres" {
  source = "./modules/postgres"
  name             = "faceit-test"
  project_id = "dl-project-354114"
  region = "europe-west2"
  database_version = "POSTGRES_14"
}


resource "google_sql_database" "database" {
project = "dl-project-354114"
name = "postgrestest"
instance = "faceit-test"

}
resource "google_sql_user" "users" {
project = "dl-project-354114"
name = "postgres"
instance = "faceit-test"
host = "%"
password = "mysecretpassword"
}


resource "google_container_registry" "registry" {
  project  = "dl-project-354114"
  location = "EU"
}
