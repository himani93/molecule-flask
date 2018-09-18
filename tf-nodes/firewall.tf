resource "google_compute_firewall" "kubernetes-the-hard-way-allow-internal" {
  name    = "kubernetes-the-hard-way-allow-internal"
  network = "${google_compute_network.kubernetes-the-hard-way.name}"

  allow {
    protocol = ["icmp", "tcp", "udp"]
    source_ranges = ["10.240.0.0/24", "10.200.0.0/16"]
  }
}

resource "google_compute_firewall" "kubernetes-the-hard-way-allow-external" {
  name    = "kubernetes-the-hard-way-allow-external"
  network = "${google_compute_network.kubernetes-the-hard-way.name}"

  allow {
    protocol = ["tcp"]
    ports = ["22", "6443"]
    source_ranges = ["0.0.0.0/0"]
  }

  allow {
    protocol = ["icmp"]
    source_ranges = ["0.0.0.0/0"]
  }
}
