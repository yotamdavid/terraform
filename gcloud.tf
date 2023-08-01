# main.tf

provider "google" {
  project = "golden-system-393111"
  region  = "us-central1"
}

resource "google_compute_instance" "example" {
  name         = "terraform-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  connection {
    type        = "ssh"
    user        = "USERNAME"
    private_key = file("~/.ssh/id_rsa")
    agent       = false
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y git docker.io python3 python3-pip",
      "sudo pip3 install flask"
    ]
  }
}
