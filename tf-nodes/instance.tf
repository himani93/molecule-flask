resource "google_compute_instance" "control-plane" {
  count = 3
  name = "controller-${count.index - 1}"
  machine_type = "n1-standard-1"
  zone = "asia-southeast1"

  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts/ubuntu-os-cloud"
      size = 200
    }
  }

  network_interface {
    network = "${google_compute_network.kubernetes-the-hard-way.self_link}"
    subnetwork = "${google_compute_subnetwork.kubernetes.name}"
    address = "10.240.0.1${count.index - 1}"
  }

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }
}

resource "google_compute_instance" "workers" {
  count = 3
  name = "worker-${count.index - 1}"
  machine_type = "n1-standard-1"
  zone = "asia-southeast1"

  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts/ubuntu-os-cloud"
      size = 200
    }
  }

  network_interface {
    network = "${google_compute_network.kubernetes-the-hard-way.self_link}"
    subnetwork = "${google_compute_subnetwork.kubernetes.name}"
    address = "10.240.0.2${count.index - 1}"
  }

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }
}

