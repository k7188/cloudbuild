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
resource "google_compute_instance" "prod_vm" {
  name         = "prod-vm"
  machine_type = "e2-small"  # Slightly larger for production
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 30  # Larger disk for production
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  tags = ["http-server", "https-server"]

  labels = {
    environment = "prod"
    owner       = "operations-team"
    cost-center = "production"
  }
}