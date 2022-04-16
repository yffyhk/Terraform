resource "google_compute_instance_group" "k8s_ig__73bf92b7164d6e85" {
  name = "k8s-ig--73bf92b7164d6e85"

  named_port {
    name = "port30806"
    port = 30806
  }

  network = "https://www.googleapis.com/compute/beta/projects/k8slab-316013/global/networks/default"
  project = "k8slab-316013"
  zone    = "us-east1-b"
}
# terraform import google_compute_instance_group.k8s_ig__73bf92b7164d6e85 projects/k8slab-316013/zones/us-east1-b/instanceGroups/k8s-ig--73bf92b7164d6e85
