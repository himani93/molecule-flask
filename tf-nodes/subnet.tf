resource "google_compute_subnetwork" "kubernetes" {
  name          = "kubernetes"
  ip_cidr_range = "10.240.0.0/24"
  region        = "asia-southeast1"
  network       = "${google_compute_network.kubernetes-the-hard-way.self_link}"
}

