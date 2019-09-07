resource "google_compute_network" "example" {
  name = "example"
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet1"
  ip_cidr_range = "192.168.10.0/24"
  network       = "${google_compute_network.example.name}"
  description   = "example.subnet1"
  region        = "${var.region}"
}
