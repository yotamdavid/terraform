provider "google" {
  credentials = file("~/Desktop/golden-system-393111-1886b3d466d6.json")
  project     = "golden-system-393111"
  region      = "us-central1"
}

resource "google_compute_instance" "example" {
  name         = "terraform-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10-buster-v20230711"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Replace "YOUR_EXTERNAL_IP" with a valid external IP address in us-central1 region
      nat_ip = "YOUR_EXTERNAL_IP"
    }
  }
