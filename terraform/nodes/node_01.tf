data "yandex_compute_image" "linux_image_01" {
  family = local.web_instance_type_map[terraform.workspace]
}

resource "yandex_compute_instance" "node_01" {
  hostname = "mydomainyouknow.fun"
  
  allow_stopping_for_update = true

  lifecycle {
    create_before_destroy = true
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.linux_image_01.id
      type = "network-nvme"
      size = "10"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    nat       = true
    ip_address = "10.10.0.4"
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}
