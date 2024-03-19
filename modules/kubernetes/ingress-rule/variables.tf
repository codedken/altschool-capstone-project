variable "region" {
  description = "The AWS region where infrastructure is deployed"
  type        = string
}

variable "project_name" {
  description = "The name of your project"
  type        = string
}

variable "domain_name" {
  description = "This is the primary domain name for the applicatioin"
  type        = string
}

variable "kubectl_host" {
  description = "The host for kubectl"
  type        = string
}

variable "kubectl_token" {
  description = "Kubectl token"
  type        = string
}

variable "k8s_config_path" {
  description = "Kubectl configuration path"
  type        = string
}

variable "cluster_ca_certificate" {
  description = "The data for the cluster ca certificate"
  type        = string
}
