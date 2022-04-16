resource "google_compute_firewall" "gke_k8s_cluster_484096b4_vms" {
  allow {
    ports    = ["1-65535"]
    protocol = "tcp"
  }

  allow {
    ports    = ["1-65535"]
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  direction     = "INGRESS"
  name          = "gke-k8s-cluster-484096b4-vms"
  network       = "https://www.googleapis.com/compute/v1/projects/k8slab-316013/global/networks/default"
  priority      = 1000
  project       = "k8slab-316013"
  source_ranges = ["10.128.0.0/9"]
  target_tags   = ["gke-k8s-cluster-484096b4-node"]
}
# terraform import google_compute_firewall.gke_k8s_cluster_484096b4_vms projects/k8slab-316013/global/firewalls/gke-k8s-cluster-484096b4-vms
