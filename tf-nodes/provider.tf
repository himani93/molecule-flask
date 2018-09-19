provider "google" {
  credentials = "${file("~/.gcp/molecule-flask-credentials.json")}"
  project     = "molecule-flask"
  region      = "asia-southeast1"
}

