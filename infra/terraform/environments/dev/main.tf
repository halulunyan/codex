terraform {
  required_version = ">= 1.5.0"
}

module "networking" {
  source      = "../../modules/networking"
  environment = var.environment
  cidr_block  = var.network_cidr
}

module "data" {
  source       = "../../modules/data"
  environment  = var.environment
  storage_tier = var.storage_tier
}

module "services" {
  source            = "../../modules/services"
  environment       = var.environment
  service_name      = var.service_name
  image_repository  = var.image_repository
  image_tag         = var.image_tag
  replicas          = var.replicas
  depends_on        = [module.networking, module.data]
}

output "service_summary" {
  description = "Human-friendly description of the service deployment for this environment."
  value       = module.services.service_summary
}
