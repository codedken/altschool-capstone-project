variable "domain_name" {
  description = "This is the domain name"
  type        = string
}

variable "alt_domain_name" {
  description = "This is the alternative domain name"
  type        = string
}

variable "region" {
  description = "Region in which AWS Resources are going to be created"
  type        = string
}

variable "env" {
  description = "Environment Variable used as a prefix"
  type        = string
}

variable "project_name" {
  description = "This is the application name"
  type        = string
}

variable "dept" {
  description = "Department that manages app"
  type        = string
}

variable "node_group_name" {
  description = "Public node group name"
  type        = string
}

variable "prometheus_version" {
  type = string
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
  description = "kubernetes configuration path"
  type        = string
}

variable "cluster" {}

variable "cluster_ca_certificate" {
  description = "The data for the cluster ca certificate"
  type        = string
}


