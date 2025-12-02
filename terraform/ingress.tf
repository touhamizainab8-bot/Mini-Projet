resource "kubernetes_ingress_v1" "notes_ingress" {
  metadata {
    name      = "notes-ingress"
    namespace = "notes"
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = "notes.${var.public_ip}.nip.io"

      http {
        # Tout ce qui commence par / -> frontend
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "notes-frontend"
              port {
                number = 80
              }
            }
          }
        }

        # Tout ce qui commence par /api -> API
        path {
          path      = "/api"
          path_type = "Prefix"

          backend {
            service {
              name = "notes-api"
              port {
                number = 5000
              }
            }
          }
        }
      }
    }
  }
}

