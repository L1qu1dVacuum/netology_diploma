terraform {
  required_version = "1.2.7"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.77"
    }
  }
}

provider "yandex" {
  token      = var.token
  cloud_id   = var.yandex_cloud_id
  folder_id  = var.yandex_folder_id
  zone       = "ru-central1-a"
}
