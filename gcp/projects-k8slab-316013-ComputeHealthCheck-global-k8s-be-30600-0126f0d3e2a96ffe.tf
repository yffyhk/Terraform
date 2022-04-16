resource "google_compute_health_check" "k8s_be_30600__0126f0d3e2a96ffe" {
  check_interval_sec = 60
  description        = "Default kubernetes L7 Loadbalancing health check."
  healthy_threshold  = 1

  http_health_check {
    port         = 30600
    proxy_header = "NONE"
    request_path = "/healthz"
  }

  name                = "k8s-be-30600--0126f0d3e2a96ffe"
  project             = "k8slab-316013"
  timeout_sec         = 60
  unhealthy_threshold = 10
}
# terraform import google_compute_health_check.k8s_be_30600__0126f0d3e2a96ffe projects/k8slab-316013/global/healthChecks/k8s-be-30600--0126f0d3e2a96ffe
