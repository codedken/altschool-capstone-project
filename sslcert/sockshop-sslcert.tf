module "ssl" {
  source          = "../modules/ssl"
  acme_server_url = "https://acme-v02.api.letsencrypt.org/directory"
  common_name     = "prayandcode.com.ng"
  email_address   = "cbsmoothoj@gmail.com"
  dns_alt_names   = ["*.prayandcode.com.ng"]
  aws_region      = "us-east-1"
  s3_bucket_name  = "sockshop-ssl"
}
