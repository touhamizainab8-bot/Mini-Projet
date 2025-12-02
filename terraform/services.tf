resource "kubernetes_service" "api" {
  metadata {
    name = "notes-api"
    namespace = "notes"
  }
  spec {
    selector = { app = "notes-api" }
    port {
      port = 5000
      target_port = 5000
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "notes-frontend"
    namespace = "notes"
  }
  spec {
    selector = { app = "notes-frontend" }
    port {
      port = 80
      target_port = 80
    }
  }
}
