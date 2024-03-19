resource "kubernetes_ingress_v1" "micro-ingress" {
  metadata {
    name      = var.project_name
    namespace = var.project_name
    labels = {
      name = "front-end"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "${var.project_name}.${var.domain_name}"
      http {
        path {
          backend {
            service {
              name = "front-end"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
