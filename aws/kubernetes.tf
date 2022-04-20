# Kubernetes provider
# https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider
# To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/terraform/kubernetes/deploy-nginx-kubernetes

# The Kubernetes provider is included in this file so the EKS module can complete successfully. Otherwise, it throws an error when creating `kubernetes_config_map.aws_auth`.
# You should **not** schedule deployments and services in this workspace. This keeps workspaces modular (one for provision EKS, another for scheduling Kubernetes resources) as per best practices.

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}


resource "kubernetes_deployment" "wordpress" {
  metadata {
    name = "wordpress"
    labels = {
      test = "wordpressApp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "wordpressApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "wordpressApp"
        }
      }

      spec {
        container {
          image = "wordpress"
          name  = "example"

          resources {
            requests = {
              cpu    = "1"
              memory = "4096"
            }
          }

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}


resource "kubernetes_deployment" "mysql" {
  metadata {
    name = "wordpress-mysql"
    labels = {
      test = "wordpressApp-mysql"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "wordpressApp-mysql"
      }
    }

    template {
      metadata {
        labels = {
          test = "wordpressApp-mysql"
        }
      }

      spec {
        container {
          image = "mysql:5.7"
          name  = "mysql"

          port {
            container_port = 3306
          }

          resources {
            requests = {
              cpu    = "500m"
              memory = "2048Mi"
            }
          }
          env {
            name = "MYSQL_ROOT_PASSWORD"
            value = "root"
          }

          env {
            name = "MYSQL_USER"
            value = "leo"
          }

          env {
            name = "MYSQL_PASSWORD"
            value = "root"
          }

          env {
            name = "MYSQL_DATABASE"
            value = "wordpress_db"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "loadbalancer" {
  metadata {
    name = "loadbalancer"
  }
  spec {
    selector = {
      test = "wordpressApp"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}