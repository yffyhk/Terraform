
provider "kubernetes" {
    host                   =  var.host
    client_certificate     =  var.client_certificate
    client_key             =  var.client_key
    cluster_ca_certificate =  var.cluster_ca_certificate
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
              cpu    = "750m"
              memory = "8192Mi"
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
              cpu    = "1000m"
              memory = "8192Mi"
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