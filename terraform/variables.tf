variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for resources"
  type        = string
  default     = "us-central1"
}

variable "github_owner" {
  description = "GitHub org or username"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo name"
  type        = string
}

variable "cloudbuild_filename" {
  description = "Path to your Cloud Build YAML file inside the repo"
  type        = string
  default     = "cloudbuild.yaml"
}
