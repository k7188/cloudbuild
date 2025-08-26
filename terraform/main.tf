terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # adjust if needed
    }
  }
  required_version = ">= 1.5.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Service Account for Cloud Build
resource "google_service_account" "cloud_build_runner" {
  account_id   = "cloud-build-runner"
  display_name = "Cloud Build Runner"
}

# Cloud Build Trigger (GitHub example)
resource "google_cloudbuild_trigger" "terraform_deploy" {
  name        = "terraform-deploy"
  description = "Trigger Terraform when pushing to GitHub"

  github {
    owner = var.github_owner
    name  = var.github_repo

    push {
      branch = "main"
    }
  }

  # The build definition file in your repo
  filename = var.cloudbuild_filename
}
