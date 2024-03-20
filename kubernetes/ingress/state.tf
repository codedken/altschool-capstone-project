terraform {
  backend "s3" {
    bucket = "sockshop"
    key    = "state-k8s-ingress-rule"
  }
}
