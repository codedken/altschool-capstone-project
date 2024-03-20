terraform {
  backend "s3" {
    bucket = "sockshop"
    key    = "state-micro-service"
  }
}
