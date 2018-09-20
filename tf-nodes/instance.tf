resource "google_compute_instance" "control-plane" {
  count = 3

  can_ip_forward = true
  name = "controller-${count.index}"
  machine_type = "n1-standard-1"
  zone = "asia-southeast1-a"

  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
      size = 200
    }
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }
    address = "10.240.0.1${count.index}"
    subnetwork = "${google_compute_subnetwork.kubernetes.name}"
  }

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }
}

resource "google_compute_instance" "workers" {
  count = 3

  can_ip_forward = true
  name = "worker-${count.index}"
  machine_type = "n1-standard-1"
  zone = "asia-southeast1-a"

  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
      size = 200
    }
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }
    address = "10.240.0.2${count.index}"
    subnetwork = "${google_compute_subnetwork.kubernetes.name}"
 }

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }
}

