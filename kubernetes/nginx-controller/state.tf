terraform {
  backend "s3" {
    bucket = "sockshop"
    key = "state-nginx-controller"
  }
}