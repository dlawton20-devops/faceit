
# ========================= VARIABLE DEFINITION =================== #
variable "project_id" {
  type = string
}
variable "name" {
  description = "Name of the Cloud SQL instance"
  type        = string
}

variable "database_version" {
  description = "The MySQL version to use. Supported values are: POSTGRES_9_6, POSTGRES_10, POSTGRES_11, POSTGRES_12. It defaults to POSTGRES_10"
  type        = string
  default     = "POSTGRES_10"
}

variable "region" {

  description = "The region where the Cloud SQL instance will reside"
  type        = string
}

variable "tier" {
  description = "Tier of the Cloud SQL instance. It defaults to db-g1-small"
  type        = string
  default     = "db-g1-small"
}





