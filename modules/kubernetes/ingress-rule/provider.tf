terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.27.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "helm" {
  kubernetes {
    config_path = var.k8s_config_path
  }
}

provider "kubernetes" {
  config_path = var.k8s_config_path
}

provider "kubectl" {
  load_config_file       = false
  alias                  = "aws"
  host                   = var.kubectl_host
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  token                  = var.kubectl_token
  config_path            = var.k8s_config_path
}
