output "cluster_id" {
  value = google_container_cluster.idling_cr_cluster.name
}

output "service-account-id" {
  value = google_service_account.gke_sa.id
}

output "project-id" {
  value = local.project
}

output "location-id" {
  value = local.location
}