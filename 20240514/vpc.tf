module "vpc" {
    source = "./modules/vpc"
    name = var.name
    tags = local.tags
    region = var.region
}