data "aws_eks_cluster" "sockshop-sales-dev" {
  name = "sockshop-sales-dev"
}
data "aws_eks_cluster_auth" "sockshop-sales-dev_auth" {
  name = "sockshop-sales-dev_auth"
}

module "micro-service" {
  source                 = "../../modules/kubernetes/micro-service"
  project_name           = "sockshop"
  cluster_name           = "sockshop-sales-dev"
  k8s_config_path        = "~/.kube/config"
  kubectl_host           = data.aws_eks_cluster.sockshop-sales-dev.endpoint
  cluster_ca_certificate = data.aws_eks_cluster.sockshop-sales-dev.certificate_authority[0].data
}
