variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "Zone for the instance"
  type        = string
  default     = "us-central1-a"
}

variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "environment" {
  description = "Environment tag (dev, test, prod)"
  type        = string
}