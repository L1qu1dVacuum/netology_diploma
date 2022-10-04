provider "yandex" {
  token      = var.token
  cloud_id   = var.yandex_cloud_id
  folder_id  = var.yandex_folder_id
  zone       = "ru-central1-a"
}

terraform {
  required_version = "1.2.9"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.77"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "kotov-tf-state-bucket"
    region     = "ru-central1-a"
    key        = "terraform/states/terraform.tfstate"
    access_key = "YCAJE0Yt2JF0OOz325Ms8oQ3v"
    secret_key = "YCOJo5Z9R_YprOeYftF25XWiQlLd6k9GbYaW7rCe"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
