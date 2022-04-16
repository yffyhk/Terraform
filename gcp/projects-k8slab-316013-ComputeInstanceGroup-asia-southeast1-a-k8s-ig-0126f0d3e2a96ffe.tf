resource "google_compute_instance_group" "k8s_ig__0126f0d3e2a96ffe" {
  instances = ["https://www.googleapis.com/compute/beta/projects/k8slab-316013/zones/asia-southeast1-a/instances/gke-k8s-cluster-default-pool-dffcce95-25f2"]
  name      = "k8s-ig--0126f0d3e2a96ffe"

  named_port {
    name = "port30600"
    port = 30600
  }

  network = "https://www.googleapis.com/compute/beta/projects/k8slab-316013/global/networks/default"
  project = "k8slab-316013"
  zone    = "asia-southeast1-a"
}
# terraform import google_compute_instance_group.k8s_ig__0126f0d3e2a96ffe projects/k8slab-316013/zones/asia-southeast1-a/instanceGroups/k8s-ig--0126f0d3e2a96ffe
