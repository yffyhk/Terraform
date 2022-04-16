resource "google_compute_firewall" "k8s_fw_l7__0126f0d3e2a96ffe" {
  allow {
    ports    = ["30000-32767", "8080"]
    protocol = "tcp"
  }

  description   = "GCE L7 firewall rule"
  direction     = "INGRESS"
  name          = "k8s-fw-l7--0126f0d3e2a96ffe"
  network       = "https://www.googleapis.com/compute/v1/projects/k8slab-316013/global/networks/default"
  priority      = 1000
  project       = "k8slab-316013"
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["gke-k8s-cluster-484096b4-node"]
}
# terraform import google_compute_firewall.k8s_fw_l7__0126f0d3e2a96ffe projects/k8slab-316013/global/firewalls/k8s-fw-l7--0126f0d3e2a96ffe
