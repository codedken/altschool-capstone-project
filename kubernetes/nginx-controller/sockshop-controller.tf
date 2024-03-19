data "aws_eks_cluster" "sockshop-sales-dev" {
  name = "sockshop-sales-dev"
}
data "aws_eks_cluster_auth" "sockshop-sales-dev_auth" {
  name = "sockshop-sales-dev_auth"
}

module "nginx_controller" {
  source                 = "../../modules/kubernetes/nginx-controller"
  region                 = "us-east-1"
  dept                   = "sales"
  env                    = "dev"
  project_name           = "sockshop"
  domain_name            = "prayandcode.com.ng"
  ingress_nginx_version  = "4.5.2"
  k8s_config_path        = "~/.kube/config"
  kubectl_host           = data.aws_eks_cluster.sockshop-sales-dev.endpoint
  kubectl_token          = data.aws_eks_cluster_auth.sockshop-sales-dev_auth.token
  cluster                = data.aws_eks_cluster.sockshop-sales-dev
  cluster_ca_certificate = data.aws_eks_cluster.sockshop-sales-dev.certificate_authority[0].data
}
