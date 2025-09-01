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
resource "google_compute_instance" "test2_vm" {
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

# Output the VM details
output "vm_public_ip" {
  value = google_compute_instance.test_vm.network_interface[0].access_config[0].nat_ip
}

output "vm_internal_ip" {
  value = google_compute_instance.test_vm.network_interface[0].network_ip
}

output "vm_name" {
  value = google_compute_instance.test_vm.name
}