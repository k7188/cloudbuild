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
resource "google_storage_bucket" "test_prod_bucket" {
  name     = "${var.project_id}-test-prod-bucket-${random_id.suffix.hex}"
  location = var.region
}

resource "random_id" "suffix" {
  byte_length = 4
}
module "prod_vm" {
  source = "../../modules/compute"

  instance_name = "prod-vm"
  machine_type  = "e2-small"  # Slightly larger for prod
  zone          = "us-central1-a"
  disk_size     = 30  # Larger disk for prod

  labels = {
    environment = "prod"
    owner       = "operations-team"
    cost-center = "production"
  }
} 