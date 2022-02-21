resource "google_service_account" "gke_sa" {
  account_id   = local.service_account_id
  display_name = local.service_account_name
  project      = local.project
}

resource "google_container_cluster" "idling_cr_cluster" {
  name                     = local.cluster_name
  location                 = local.location
  project                  = local.project
  remove_default_node_pool = true
  initial_node_count       = 1

  addons_config {
    network_policy_config {
      disabled = false
    }
  }
  network_policy {
    enabled = true
  }
}

resource "google_container_node_pool" "idling_cr_cluster_nodes" {
  name       = local.cluster_node_pool_name
  location   = local.location
  project    = local.project
  cluster    = google_container_cluster.idling_cr_cluster.name
  node_count = local.cluster_node_count

  node_config {
    preemptible  = true
    machine_type = local.cluster_machine_type
    image_type = local.cluster_image_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}