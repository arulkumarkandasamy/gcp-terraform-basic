provider "google-beta" {
  credentials = "${file("C:\\Users\\KANDASAMYA\\Documents\\Vodafone\\Softwares\\gcp\\arulgkedemo-2f6339281a24.json")}"
  project     = "arulgkedemo"
  region      = "europe-west2"
  version     = "~> 2.14.0"
}
