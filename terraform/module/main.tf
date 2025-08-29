resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    network = var.network
    access_config {
      // Ephemeral public IP
    }
  }

  tags = var.tags

  metadata = {
    enable-oslogin = "TRUE"
  }

  labels = var.labels
}