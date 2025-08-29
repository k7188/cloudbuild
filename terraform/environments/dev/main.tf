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

resource "google_storage_bucket" "test_dev_bucket" {
  name     = "${var.project_id}-test-dev-bucket-${random_id.suffix.hex}"
  location = var.region
}

resource "random_id" "suffix" {
  byte_length = 4
}
module "dev_vm" {
  source = "../../modules/compute"

  instance_name = "dev-vm"
  machine_type  = "e2-micro"
  zone          = "us-central1-a"
  disk_size     = 20

  labels = {
    environment = "dev"
    owner       = "development-team"
  }  
}