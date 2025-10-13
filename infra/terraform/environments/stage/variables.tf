variable "environment" {
  description = "Deployment environment slug."
  type        = string
  default     = "stage"
}

variable "region" {
  description = "Cloud provider region."
  type        = string
  default     = "us-east-2"
}

variable "network_cidr" {
  description = "Primary network CIDR block."
  type        = string
  default     = "10.20.0.0/16"
}

variable "storage_tier" {
  description = "Default storage tier."
  type        = string
  default     = "standard"
}

variable "service_name" {
  description = "Service identifier."
  type        = string
  default     = "fastapi"
}

variable "image_repository" {
  description = "Container image repository."
  type        = string
  default     = "ghcr.io/example/fastapi"
}

variable "image_tag" {
  description = "Container image tag."
  type        = string
  default     = "stage"
}

variable "replicas" {
  description = "Replica count for the service."
  type        = number
  default     = 2
}
