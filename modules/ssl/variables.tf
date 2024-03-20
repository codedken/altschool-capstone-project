variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "acme_server_url" {
  description = "The server url for the Let's Encrypt ACME CA"
  type        = string
}

variable "common_name" {
  description = "common name of ssl cert request"
  type        = string
}

variable "email_address" {
  description = "Email Address for ACME registration"
  type        = string
}

variable "dns_alt_names" {
  description = "The alternative names for the ssl cert request"
  type        = list(string)
  default     = []
}

variable "s3_bucket_name" {
  type = string
}
