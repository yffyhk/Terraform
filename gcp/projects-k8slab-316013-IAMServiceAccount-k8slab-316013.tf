resource "google_service_account" "k8slab_316013" {
  account_id   = "k8slab-316013"
  display_name = "App Engine default service account"
  project      = "k8slab-316013"
}
# terraform import google_service_account.k8slab_316013 projects/k8slab-316013/serviceAccounts/k8slab-316013@k8slab-316013.iam.gserviceaccount.com
