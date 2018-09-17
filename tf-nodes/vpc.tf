resource "google_compute_network" "kubernetes-the-hard-way" {
  name                    = "kubernetes-the-hard-way"
  auto_create_subnetworks = "false"
}

