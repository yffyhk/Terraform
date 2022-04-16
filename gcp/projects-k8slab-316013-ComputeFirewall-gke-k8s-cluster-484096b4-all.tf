resource "google_compute_firewall" "gke_k8s_cluster_484096b4_all" {
  allow {
    protocol = "ah"
  }

  allow {
    protocol = "esp"
  }

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "sctp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  direction     = "INGRESS"
  name          = "gke-k8s-cluster-484096b4-all"
  network       = "https://www.googleapis.com/compute/v1/projects/k8slab-316013/global/networks/default"
  priority      = 1000
  project       = "k8slab-316013"
  source_ranges = ["10.56.0.0/14"]
  target_tags   = ["gke-k8s-cluster-484096b4-node"]
}
# terraform import google_compute_firewall.gke_k8s_cluster_484096b4_all projects/k8slab-316013/global/firewalls/gke-k8s-cluster-484096b4-all
