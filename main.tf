terraform {}

provider "google" {
  #project     = var.project_id
  region      = var.region
  #credentials = "your_credentials.json"
}



resource "random_string" "main" {
  length    = 4
  min_lower = 4
  special   = false
}

data "google_compute_zones" "main" {
  region = var.region
}

locals {
  prefix = random_string.main.result
}


# Enable required APIs

resource "google_project_service" "service_networking" {
  #project = var.project_id
  service                    = "servicenetworking.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "compute" {
  #project = var.project_id
  service                    = "compute.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}


resource "google_project_service" "ids" {
  #project = var.project_id
  service                    = "ids.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

