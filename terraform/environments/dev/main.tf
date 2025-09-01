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

module "web_server" {
  source = "../../module/compute"
  instance_name = "dev-webserver-01"
  machine_type = "e2-micro"
  zone= "us-central1-a"
  project_id = var.project_id
  environment = "dev"
}