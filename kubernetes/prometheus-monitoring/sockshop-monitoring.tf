data "aws_eks_cluster" "sockshop-sales-dev" {
  name = "sockshop-sales-dev"
}
data "aws_eks_cluster_auth" "sockshop-sales-dev_auth" {
  name = "sockshop-sales-dev_auth"
}

module "prometheus-helm" {
  source                 = "../../modules/kubernetes/prometheus-helm"
  region                 = "us-east-1"
  env                    = "dev"
  dept                   = "sales"
  project_name           = "sockshop"
  domain_name            = "prayandcode.com.ng"
  alt_domain_name        = "*.prayandcode.com.ng"
  node_group_name        = "sockshop-eks-node-group"
  k8s_config_path        = "~/.kube/config"
  prometheus_version     = "45.7.1"
  cluster                = data.aws_eks_cluster.sockshop-sales-dev
  kubectl_host           = data.aws_eks_cluster.sockshop-sales-dev.endpoint
  kubectl_token          = data.aws_eks_cluster_auth.sockshop-sales-dev_auth.token
  cluster_ca_certificate = data.aws_eks_cluster.sockshop-sales-dev.certificate_authority[0].data
}
