data "aws_eks_node_group" "eks-node-group" {
  cluster_name    = "${var.project_name}-${var.dept}-${var.env}"
  node_group_name = var.node_group_name
}

resource "time_sleep" "wait_for_kubernetes" {

  depends_on = [
    var.cluster
  ]

  create_duration = "20s"
}

resource "kubernetes_namespace" "kube-namespace" {
  depends_on = [data.aws_eks_node_group.eks-node-group, time_sleep.wait_for_kubernetes]
  metadata {
    name = "prometheus"
  }
}

resource "helm_release" "prometheus" {
  depends_on       = [kubernetes_namespace.kube-namespace, time_sleep.wait_for_kubernetes]
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = kubernetes_namespace.kube-namespace.id
  create_namespace = true
  version          = var.prometheus_version
  values = [
    file("../../modules/kubernetes/prometheus-helm/values.yaml")
  ]
  timeout = 2000


  set {
    name  = "podSecurityPolicy.enabled"
    value = true
  }

  set {
    name  = "server.persistentVolume.enabled"
    value = false
  }

  # You can provide a map of value using yamlencode. Don't forget to escape the last element after point in the name
  set {
    name = "server\\.resources"
    value = yamlencode({
      limits = {
        cpu    = "200m"
        memory = "50Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "30Mi"
      }
    })
  }
}

