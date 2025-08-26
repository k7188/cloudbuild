terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Service Account for Terraform/Cloud Build
resource "google_service_account" "cloud_build_runner" {
  account_id   = "cloud-build-runner"
  display_name = "Cloud Build Runner"
}
