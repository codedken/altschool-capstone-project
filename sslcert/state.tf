terraform {
  backend "s3" {
    bucket = "sockshop"
    key    = "state-ssl"
    region = "us-east-1"
  }
}
