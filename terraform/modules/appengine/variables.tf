# ======================== DATA SOURCE DEFINITION ================= #

# It collects the different regions available within GCP.

data "google_compute_regions" "available" {
  # project = var.project_id
}

# ========================= VARIABLE DEFINITION =================== #
variable "project" {
  description = "(Required) The project ID to create the application under. ~>NOTE: GCP only accepts project ID, not project number. If you are using number, you may get a `Permission denied` error."
  type        = string
  default     = ""
}

variable "location_id" {
  description = "(Required) The location to serve the app from."
  type        = string
  default     = ""
}




variable "serving_status" {
  description = "(Optional) The serving status of the app."
  type        = string
  default     = null

  validation {
    condition     = var.serving_status == null || contains(["UNSPECIFIED", "SERVING", "USER_DISABLED", "SYSTEM_DISABLED"], var.serving_status == null ? "" : var.serving_status)
    error_message = "The serving status of the app must be one of [UNSPECIFIED, SERVING, USER_DISABLED, SYSTEM_DISABLED]."
  }
}


