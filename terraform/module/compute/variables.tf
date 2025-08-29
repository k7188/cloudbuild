variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "Zone for the instance"
  type        = string
  default     = "us-central1-a"
}

variable "image" {
  description = "Boot image"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 20
}

variable "network" {
  description = "Network to attach to"
  type        = string
  default     = "default"
}

variable "tags" {
  description = "Network tags"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "Resource labels"
  type        = map(string)
  default     = {}
}