terraform {
  backend "gcs" {
    bucket  = "molecule-flask"
    prefix  = "terraform/state"
  }
}

