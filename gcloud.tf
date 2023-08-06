provider "google" {
  credentials = file("~/Desktop/golden-system-393111-1886b3d466d6.json")
  project     = "golden-system-393111"
  region      = "us-central1"
}

resource "google_container_cluster" "test" {
  name    = "test-clusser"
  project         = "golden-system-393111"
  location = "us-central1-a" 
  enable_autopilot = true
}
