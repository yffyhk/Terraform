resource "google_service_account" "639723339134_compute" {
  account_id   = "639723339134-compute"
  display_name = "Compute Engine default service account"
  project      = "k8slab-316013"
}
# terraform import google_service_account.639723339134_compute projects/k8slab-316013/serviceAccounts/639723339134-compute@k8slab-316013.iam.gserviceaccount.com
