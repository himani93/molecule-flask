resource "google_compute_firewall" "kubernetes-the-hard-way-allow-internal" {
  name    = "kubernetes-the-hard-way-allow-internal"
  network = "${google_compute_network.kubernetes-the-hard-way.name}"

  allow {
    protocol = ["icmp", "tcp", "udp"]
    source_ranges = ["10.240.0.0/24", "10.200.0.0/16"]
  }
}

