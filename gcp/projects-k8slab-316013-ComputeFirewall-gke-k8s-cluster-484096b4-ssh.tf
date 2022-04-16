resource "google_compute_firewall" "gke_k8s_cluster_484096b4_ssh" {
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "gke-k8s-cluster-484096b4-ssh"
  network       = "https://www.googleapis.com/compute/v1/projects/k8slab-316013/global/networks/default"
  priority      = 1000
  project       = "k8slab-316013"
  source_ranges = ["34.124.181.46/32"]
  target_tags   = ["gke-k8s-cluster-484096b4-node"]
}
# terraform import google_compute_firewall.gke_k8s_cluster_484096b4_ssh projects/k8slab-316013/global/firewalls/gke-k8s-cluster-484096b4-ssh
