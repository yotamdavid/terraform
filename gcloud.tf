provider "google" {
  credentials = file("~/Desktop/golden-system-393111-1886b3d466d6.json")
  project     = "golden-system-393111"
  region      = "us-central1"
}

resource "google_container_cluster" "test" {
  display_name    = "test-clusser"
  project         = "golden-system-393111"
  regions         = ["us-central1"]
  enable_autopilot = true


