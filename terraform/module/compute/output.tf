output "instance_id" {
  description = "The ID of the created instance"
  value       = google_compute_instance.vm.instance_id
}

output "internal_ip" {
  description = "Internal IP address of the instance"
  value       = google_compute_instance.vm.network_interface[0].network_ip
}

output "external_ip" {
  description = "External IP address of the instance"
  value       = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}