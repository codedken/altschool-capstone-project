terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "2.21.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}
