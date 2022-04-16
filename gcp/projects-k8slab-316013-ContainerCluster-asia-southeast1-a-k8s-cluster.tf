resource "google_container_cluster" "k8s_cluster" {
  addons_config {
    dns_cache_config {
      enabled = false
    }

    gce_persistent_disk_csi_driver_config {
      enabled = true
    }

    horizontal_pod_autoscaling {
      disabled = false
    }

    http_load_balancing {
      disabled = false
    }

    network_policy_config {
      disabled = true
    }
  }

  cluster_autoscaling {
    autoscaling_profile = "BALANCED"
    enabled             = false
  }

  cluster_ipv4_cidr = "10.56.0.0/14"

  cluster_telemetry {
    type = "ENABLED"
  }

  database_encryption {
    state = "DECRYPTED"
  }

  datapath_provider         = "LEGACY_DATAPATH"
  default_max_pods_per_node = 110

  default_snat_status {
    disabled = false
  }

  enable_shielded_nodes = true

  ip_allocation_policy {
    cluster_ipv4_cidr_block       = "10.56.0.0/14"
    cluster_secondary_range_name  = "gke-k8s-cluster-pods-484096b4"
    services_ipv4_cidr_block      = "10.60.0.0/20"
    services_secondary_range_name = "gke-k8s-cluster-services-484096b4"
  }

  location = "asia-southeast1-a"

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }

  name    = "k8s-cluster"
  network = "projects/k8slab-316013/global/networks/default"

  network_policy {
    enabled  = false
    provider = "PROVIDER_UNSPECIFIED"
  }

  networking_mode = "VPC_NATIVE"

  node_config {
    disk_size_gb = 100
    disk_type    = "pd-standard"
    image_type   = "COS_CONTAINERD"
    machine_type = "e2-medium"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    service_account = "default"

    shielded_instance_config {
      enable_integrity_monitoring = true
    }
  }

  node_locations = ["asia-southeast1-b"]
  node_version   = "1.21.6-gke.1503"

  notification_config {
    pubsub {
      enabled = false
    }
  }

  pod_security_policy_config {
    enabled = false
  }

  project = "k8slab-316013"

  release_channel {
    channel = "REGULAR"
  }

  subnetwork = "projects/k8slab-316013/regions/asia-southeast1/subnetworks/default"
}
# terraform import google_container_cluster.k8s_cluster k8slab-316013/asia-southeast1-a/k8s-cluster
