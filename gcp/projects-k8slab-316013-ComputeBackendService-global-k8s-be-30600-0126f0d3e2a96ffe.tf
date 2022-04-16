resource "google_compute_backend_service" "k8s_be_30600__0126f0d3e2a96ffe" {
  connection_draining_timeout_sec = 0
  description                     = "{\"kubernetes.io/service-name\":\"kube-system/default-http-backend\",\"kubernetes.io/service-port\":\"\\u0026ServiceBackendPort{Name:http,Number:0,}\"}"
  health_checks                   = ["https://www.googleapis.com/compute/v1/projects/k8slab-316013/global/healthChecks/k8s-be-30600--0126f0d3e2a96ffe"]
  load_balancing_scheme           = "EXTERNAL"

  log_config {
    enable      = true
    sample_rate = 1
  }

  name             = "k8s-be-30600--0126f0d3e2a96ffe"
  port_name        = "port30600"
  project          = "k8slab-316013"
  protocol         = "HTTP"
  session_affinity = "NONE"
  timeout_sec      = 30
}
# terraform import google_compute_backend_service.k8s_be_30600__0126f0d3e2a96ffe projects/k8slab-316013/global/backendServices/k8s-be-30600--0126f0d3e2a96ffe
