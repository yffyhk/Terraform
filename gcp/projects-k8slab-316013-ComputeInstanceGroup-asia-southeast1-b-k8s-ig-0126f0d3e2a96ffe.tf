resource "google_compute_instance_group" "k8s_ig__0126f0d3e2a96ffe" {
  instances = ["https://www.googleapis.com/compute/beta/projects/k8slab-316013/zones/asia-southeast1-b/instances/gke-k8s-cluster-default-pool-fbfbd6a0-g92d", "https://www.googleapis.com/compute/beta/projects/k8slab-316013/zones/asia-southeast1-b/instances/gke-k8s-cluster-default-pool-fbfbd6a0-w4kd"]
  name      = "k8s-ig--0126f0d3e2a96ffe"

  named_port {
    name = "port30600"
    port = 30600
  }

  network = "https://www.googleapis.com/compute/beta/projects/k8slab-316013/global/networks/default"
  project = "k8slab-316013"
  zone    = "asia-southeast1-b"
}
# terraform import google_compute_instance_group.k8s_ig__0126f0d3e2a96ffe projects/k8slab-316013/zones/asia-southeast1-b/instanceGroups/k8s-ig--0126f0d3e2a96ffe
