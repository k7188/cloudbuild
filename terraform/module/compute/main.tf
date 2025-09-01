resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  labels = {
    environment = var.environment
    managed-by  = "terraform"
  }

  tags = ["http-server", "https-server"]
}