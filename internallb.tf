resource "google_compute_health_check" "kvs-health-check" {
  name = "kvs-health-check"
  check_interval_sec = 1
  timeout_sec        = 1

  tcp_health_check {
    port = "11210"
  }
}

resource "google_compute_region_backend_service" "kvs-int-lb" {
  name                  = "kvs-int-lb"
  health_checks         = ["${google_compute_health_check.kvs-health-check.self_link}"]
  protocol              = "TCP"
  timeout_sec           = 10
  session_affinity      = "NONE"
  region                = "${var.region}"

  backend {
    group = "${google_compute_instance_group.kvs-group.self_link}"
  }
}

resource "google_compute_forwarding_rule" "kvs-int-lb-forwarding-rule" {
  name                  = "kvs-int-lb-forwarding-rule"
  load_balancing_scheme = "INTERNAL"
  ports                 = ["11210"]
  region                = "${var.region}"
  network               = "${google_compute_network.example.self_link}"
  subnetwork            = "${google_compute_subnetwork.subnet1.self_link}"
  backend_service       = "${google_compute_region_backend_service.kvs-int-lb.self_link}"
  ip_address            = "192.168.10.100"
}

