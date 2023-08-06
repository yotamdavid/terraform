provider "google" {
  credentials = file("~/Desktop/golden-system-393111-1886b3d466d6.json")
  project     = "golden-system-393111"
  region      = "us-central1"
}

resource "google_ml_engine_model" "my_classifier" {
  name     = "test-classifier"
  project  = "golden-system-393111"
  regions  = ["us-central1"]

  labels = {
    environment = "production"
    team        = "data-science"
  }

  default_version {
    name = "v1"
    deployment_uri = "gs://my-bucket/trained_model"
    runtime_version = "1.15"
    machine_type = "n1-standard-4"
  }
}
