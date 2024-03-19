variable "project_name" {
  description = "The name of your project"
  type        = string
}

variable "kubectl_host" {
  description = "The host for kubectl"
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

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}
