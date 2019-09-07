variable "region" {
  default = "europe-west2"
}

variable "region_zone" {
  default = "europe-west2-c"
}

variable "bastion_ssh_keys" {
  type = "string"
  default = "exampleadmin:~/.ssh/id_rsa.pub"
}

variable "kvs_ssh_keys" {
  type = "string"
  default = "exampleadmin:~/.ssh/id_rsa.pub"
}
