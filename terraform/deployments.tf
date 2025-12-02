resource "kubernetes_deployment" "api" {
  metadata {
    name      = "notes-api"
    namespace = "notes"
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "notes-api" }
    }

    template {
      metadata {
        labels = { app = "notes-api" }
      }

      spec {
        container {
          name  = "notes-api"
          image = "notes-api:1.0"

          image_pull_policy = "Never"

          port {
            container_port = 5000
          }

          env {
            name  = "DB_HOST"
            value = "notes-db"
          }
          env {
            name  = "DB_NAME"
            value = "notesdb"
          }
          env {
            name  = "DB_USER"
            value = "notesuser"
          }
          env {
            name  = "DB_PASSWORD"
            value = "notespass"
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "frontend" {
  metadata {
    name      = "notes-frontend"
    namespace = "notes"
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "notes-frontend" }
    }

    template {
      metadata {
        labels = { app = "notes-frontend" }
      }

      spec {
        container {
          name  = "notes-frontend"
          image = "notes-frontend:1.0"

          image_pull_policy = "Never"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "db" {
  metadata {
    name      = "notes-db"
    namespace = "notes"
  }

  spec {
    replicas = 1

    selector {
      match_labels = { app = "notes-db" }
    }

    template {
      metadata {
        labels = { app = "notes-db" }
      }

      spec {
        container {
          name  = "notes-db"
          image = "notes-db:1.0"

          image_pull_policy = "Never"

          port {
            container_port = 5432
          }

          env {
            name  = "POSTGRES_DB"
            value = "notesdb"
          }
          env {
            name  = "POSTGRES_USER"
            value = "notesuser"
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = "notespass"
          }
        }
      }
    }
  }
}

