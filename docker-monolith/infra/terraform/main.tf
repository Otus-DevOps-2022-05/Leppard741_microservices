terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "var.service_account_key_file"
  cloud_id  = "var.cloud_id"
  folder_id = "var.folder_id"
  zone      = "var.zone"
}

module "vpc" {
  source   = "./modules/vpc"
  ip_range = var.ip_range
}

module "app" {
  source          = "./modules/app"
  public_key_path = var.public_key_path
  image_family    = var.image_family
  subnet_id       = module.vpc.subnet_id
  instance_count  = var.instance_count
  depends_on      = [module.vpc.subnet_id]
}
