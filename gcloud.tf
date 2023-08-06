provider "google" {
  credentials = file("~/Desktop/golden-system-393111-1886b3d466d6.json")
  project     = "golden-system-393111"
  region      = "us-central1"
}

resource "google_container_cluster" "test" {
  name     = "my-gke-cluster"
  location = "us-central1"
  
  remove_default_node_pool = true  # נסה להסיר את סביבת העבודה הברירתית

  autopilot {
    enabled = true
  }
}
