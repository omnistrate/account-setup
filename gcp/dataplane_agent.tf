# Omnistrate dataplane agent service account
resource "google_service_account" "omnistrate_dataplane_agent" {
  project = data.google_project.current.project_id
  account_id   = "omnistrate-dataplane-agent-${var.account_config_identity_id}"
  display_name = "Omnistrate Dataplane Agent Service Account"
}

# Permissions for dataplane agent service account
resource "google_project_iam_member" "compute_admin_for_dataplane" {
  project = data.google_project.current.project_id
  role   = "roles/compute.admin"
  member = "serviceAccount:${google_service_account.omnistrate_dataplane_agent.email}"
}

resource "google_project_iam_member" "kubernetes_admin_for_dataplane" {
  project = data.google_project.current.project_id
  role   = "roles/container.admin"
  member = "serviceAccount:${google_service_account.omnistrate_dataplane_agent.email}"
}

resource "google_project_iam_member" "storage_admin_for_dataplane" {
  project = data.google_project.current.project_id
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.omnistrate_dataplane_agent.email}"
}

resource "google_project_iam_member" "service_account_user_for_dataplane" {
  project = data.google_project.current.project_id
  role   = "roles/iam.serviceAccountUser"
  member = "serviceAccount:${google_service_account.omnistrate_dataplane_agent.email}"
}