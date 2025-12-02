provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "notes" {
  metadata {
    name = "notes"
  }
}
