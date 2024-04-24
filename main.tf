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

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}



