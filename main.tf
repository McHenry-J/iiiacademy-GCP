terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "i-ii-iii-academy"
region = "asia-east1"
zone = "asia-east1-b"
credentials = "i-ii-iii-academy-67bce3e5a13b.json"
}


resource "google_storage_bucket" "academybucket-1" {
  name          = "iiibucket-1"
  location      = "US"
  force_destroy = true
}



resource "google_compute_network" "auto-vpc-tf" {
  name = "auto-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name ="sub-sg"
  network = google_compute_network.auto-vpc-tf.id
  ip_cidr_range = "10.72.1.0/24"
  region = "asia-northeast1"
}


#resource "google_compute_network" "custom-vpc-tf" {
  #name = "custom-vpc-tf"
 #auto_create_subnetworks = false
#}

output "auto" {
  value = google_compute_network.auto-vpc-tf.id
}

#output "custom" {
#  value = google_compute_network.custom-vpc-tf.id
#}