variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)."
  type        = string
}

variable "service_name" {
  description = "Logical service name."
  type        = string
  default     = "fastapi"
}

variable "image_repository" {
  description = "OCI repository hosting the service image."
  type        = string
}

variable "image_tag" {
  description = "Image tag to deploy."
  type        = string
  default     = "latest"
}

variable "replicas" {
  description = "Desired replica count."
  type        = number
  default     = 1
}
