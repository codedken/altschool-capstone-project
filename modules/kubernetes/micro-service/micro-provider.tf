terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.27.0"
    }
  }
}

provider "kubernetes" {
  host                   = var.kubectl_host
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  config_path            = var.k8s_config_path
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

resource "kubernetes_namespace" "kube-namespace" {
  metadata {
    name = var.project_name
  }
}
