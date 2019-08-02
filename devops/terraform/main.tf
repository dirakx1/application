provider "google" {
  credentials = "${file("account.json")}"
  project     = "my-project-id"
  region      = "us-central1"
}

ocals {
  all_apis  = "${var.apis}"
  bucket_id = "${var.bucket_id}"
}

# [START] APIs definition - ENABLE all_apis

resource "google_project_service" "enabling_api" {
  count              = "${length(local.all_apis)}"
  project            = "${var.project_name}"
  service            = "${element(local.all_apis, count.index)}"
  disable_on_destroy = false
}

# [END] APIs definition


# [START] GKE definiton

resource "google_container_cluster" "primary" {
  name                     = "${var.cluster_name}"
  project                  = "${var.project_name}"
  location                 = "us-east1-b"
  min_master_version       = "1.12.9-gke.7"
  network                  = "${var.network}"      # Name of shared network see https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-shared-vpc
  subnetwork               = "${var.subnetwork}"
  remove_default_node_pool = true

  initial_node_count = 3

  # Setting an empty username and password explicitly disables basic auth
  master_auth {
    username = ""
    password = ""
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${var.pool_name}"
  project    = "${var.project_name}"
  location   = "us-east1-b"                                 # TODO Should be multizone for PROD
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "${var.machine_type}"

    metadata {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write", 
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

# [END] GKE definiton
