locals {
  project                = "fluid-house-332216"
  location               = "us-central1"
  cluster_machine_type   = "e2-medium"
  cluster_image_type = "UBUNTU"
  cluster_node_pool_name = "gke-cluster-node-pool"
  cluster_name           = "idling-project-cluster"
  cluster_node_count     = 1
  service_account_name   = "Terraform Service Account"
  service_account_id     = "terraform-account-id"
}
