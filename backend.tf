terraform {
  backend "gcs" {
    bucket  = "arulgkedemo_cloudbuild"
    path    = "terraform.tfstate"
    credentials = "C:\\Users\\KANDASAMYA\\Documents\\Vodafone\\Softwares\\gcp\\arulgkedemo-2f6339281a24.json"
  }
}
