# Configure the Google Cloud provider
terraform {
  required_version = ">= 1.5.0"
  
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "clcd-cloudbuild-huss-terraform-state"  # Change to your state bucket
    prefix = "terraform/test-vm"       # Separate state for test-vm
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Create a simple VM
resource "google_compute_instance" "test2113_vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.vm_image
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Ephemeral public IP
    }
  }

  tags = ["test-vm", "ssh-enabled"]

  metadata = {
    enable-oslogin = "TRUE"
  }

  labels = {
    environment = "test"
    owner       = "terraform"
    purpose     = "testing"
  }
}

