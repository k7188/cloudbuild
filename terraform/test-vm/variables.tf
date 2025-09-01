variable "project_id" {
  description = "The GCP project ID where the VM will be created"
  type        = string
}

variable "region" {
  description = "The GCP region for resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone for the VM"
  type        = string
  default     = "us-central1-a"
}

variable "vm_name" {
  description = "Name of the test VM"
  type        = string
  default     = "test-vm-01"
}

variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
  default     = "e2-micro"
}

variable "vm_image" {
  description = "Boot image for the VM"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 20
}

variable "disk_type" {
  description = "Boot disk type"
  type        = string
  default     = "pd-standard"
}