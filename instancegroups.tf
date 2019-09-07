resource "google_compute_instance_group" "kvs-group" {
  name        = "kvs-group"
  description = "kvs instance group"
  zone        = "${var.region_zone}"
  instances = [
    "${google_compute_instance.kvs01.self_link}",
    "${google_compute_instance.kvs02.self_link}",
    "${google_compute_instance.kvs03.self_link}",
  ]
}