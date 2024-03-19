data "aws_eks_cluster" "sockshop-sales-dev" {
  name = "sockshop-sales-dev"
}
data "aws_eks_cluster_auth" "sockshop-sales-dev_auth" {
  name = "sockshop-sales-dev_auth"
}

module "ingress_rule" {
  source                 = "../../modules/kubernetes/ingress-rule"
  project_name           = "sockshop"
  domain_name            = "prayandcode.com.ng"
  region                 = "us-east-1"
  k8s_config_path        = "~/.kube/config"
  kubectl_host           = data.aws_eks_cluster.sockshop-sales-dev.endpoint
  kubectl_token          = data.aws_eks_cluster_auth.sockshop-sales-dev_auth.token
  cluster_ca_certificate = data.aws_eks_cluster.sockshop-sales-dev.certificate_authority[0].data
}
