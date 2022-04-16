resource "google_service_account" "project_pod" {
  account_id   = "project-pod"
  description  = "for pod"
  display_name = "project-pod"
  project      = "k8slab-316013"
}
# terraform import google_service_account.project_pod projects/k8slab-316013/serviceAccounts/project-pod@k8slab-316013.iam.gserviceaccount.com
