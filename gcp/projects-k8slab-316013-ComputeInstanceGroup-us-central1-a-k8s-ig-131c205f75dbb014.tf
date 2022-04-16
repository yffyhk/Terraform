resource "google_compute_instance_group" "k8s_ig__131c205f75dbb014" {
  name = "k8s-ig--131c205f75dbb014"

  named_port {
    name = "port32068"
    port = 32068
  }

  network = "https://www.googleapis.com/compute/beta/projects/k8slab-316013/global/networks/default"
  project = "k8slab-316013"
  zone    = "us-central1-a"
}
# terraform import google_compute_instance_group.k8s_ig__131c205f75dbb014 projects/k8slab-316013/zones/us-central1-a/instanceGroups/k8s-ig--131c205f75dbb014
