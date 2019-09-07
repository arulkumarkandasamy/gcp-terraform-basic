resource "google_compute_address" "bastion01" {
  name         = "bastion01"
  region       = "${var.region}"
}

resource "google_compute_instance" "bastion01" {
  name         = "bastion01"
  machine_type = "f1-micro"
  zone         = "${var.region_zone}"
  tags         = ["server", "bastion"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  metadata_startup_script = <<EOT
yum install -y policycoreutils-python
semanage port -a -t ssh_port_t -p tcp 10022
sed -i 's/^#Port 22/Port 22\nPort 10022/' /etc/ssh/sshd_config
systemctl restart sshd
timedatectl set-timezone Asia/Tokyo
EOT

  network_interface {
    address    = "192.168.10.2"
    subnetwork = "${google_compute_subnetwork.subnet1.name}"
    access_config {
      # static external ip
      nat_ip   = "${google_compute_address.bastion01.address}"
    }
  }

  metadata = {
     block-project-ssh-keys = "true"
     sshKeys = "${var.bastion_ssh_keys}"
  }
}
