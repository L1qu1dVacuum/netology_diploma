data "yandex_compute_image" "linux_image_02" {
  family = local.web_instance_type_map[terraform.workspace]
}

resource "yandex_compute_instance" "node_02" {
  hostname = "db01.mydomainyouknow.fun"
  
  allow_stopping_for_update = true

  lifecycle {
    create_before_destroy = true
  }

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.linux_image_02.id
      type = "network-nvme"
      size = "15"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    nat       = true
    ip_address = "10.10.0.5"    
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}
