resource "google_compute_instance" "kvs01" {
  name         = "kvs01"
  machine_type = "n1-standard-2"
  zone         = "${var.region_zone}"
  tags         = ["server", "kvs"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size = "50"
      type = "pd-ssd"
    }
  }

  network_interface {
    address = "192.168.10.3"
    subnetwork = "${google_compute_subnetwork.subnet1.name}"
    access_config {
    }
  }

  metadata_startup_script = <<EOT
timedatectl set-timezone Europe/London
EOT

  metadata = {
    block-project-ssh-keys = "true"
    sshKeys = "${var.kvs_ssh_keys}"
  }
}

resource "google_compute_instance" "kvs02" {
  name         = "kvs02"
  machine_type = "n1-standard-2"
  zone         = "${var.region_zone}"
  tags         = ["server", "kvs"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size = "50"
      type = "pd-ssd"
    }
  }

  network_interface {
    address = "192.168.10.4"
    subnetwork = "${google_compute_subnetwork.subnet1.name}"
    access_config {
    }
  }

  metadata_startup_script = <<EOT
timedatectl set-timezone Europe/London
EOT

  metadata = {
     block-project-ssh-keys = "true"
     sshKeys = "${var.kvs_ssh_keys}"
  }
}

resource "google_compute_instance" "kvs03" {
  name         = "kvs03"
  machine_type = "n1-standard-2"
  zone         = "${var.region_zone}"
  tags         = ["server", "kvs"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size = "50"
      type = "pd-ssd"
    }
  }

  network_interface {
    address = "192.168.10.5"
    subnetwork = "${google_compute_subnetwork.subnet1.name}"
    access_config {
    }
  }

  metadata_startup_script = <<EOT
timedatectl set-timezone Europe/London
EOT

  metadata = {
     block-project-ssh-keys = "true"
     sshKeys = "${var.kvs_ssh_keys}"
  }
}
