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

 online_prediction_logging {
    node_count = 1
    python_version = "3.7"
    package_uris = ["gs://my-bucket/trained_model/my_model-1.0.tar.gz"]
  }

 default_version {
    name            = "v1"
    
    runtime_version = "1.15"
    
    machine_type    = "n1-standard-4"
  }
}

