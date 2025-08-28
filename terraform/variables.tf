variable "project_id" {
  description = "GCP project ID"
  type        = string
#  default     = "clcd-cloudbuild-huss"
}


variable "region" {
  description = "Region for resources"
  type        = string
  default     = "us-central1"
}
