provider "google" {
  credentials = "${file("account.json")}"
  project     = "molecule-flask"
  region      = "asia-southeast1"
}

