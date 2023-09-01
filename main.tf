provider "google" {
  project     = var.project
  credentials = file(var.credentials)
  region      = var.region
  zone        = var.zone
}

#################################### Create Compute Engine ###########################

resource "google_compute_instance" "pjk_instance" {
  name         = "pjk-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230814"
      labels = {
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}
