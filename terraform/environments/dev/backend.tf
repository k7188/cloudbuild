
terraform {
  backend "gcs" {
    bucket = "clcd-cloudbuild-huss-terraform-state"
    prefix = "terraform/devstate"
  }
}