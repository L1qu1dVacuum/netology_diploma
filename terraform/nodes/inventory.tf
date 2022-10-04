resource "local_file" "inventory" {
  content = <<-DOC
    
    [you-node]
    www.mydomainyouknow.fun ansible_host=${yandex_compute_instance.node_01.network_interface.0.nat_ip_address}

    [db-node]
    db01.mydomainyouknow.fun ansible_host=${yandex_compute_instance.node_02.network_interface.0.nat_ip_address}
    db02.mydomainyouknow.fun ansible_host=${yandex_compute_instance.node_03.network_interface.0.nat_ip_address}

    [app-node]
    app.mydomainyouknow.fun ansible_host=${yandex_compute_instance.node_04.network_interface.0.nat_ip_address}

    [gitlab-node]
    gitlab.mydomainyouknow.fun ansible_host=${yandex_compute_instance.node_05.network_interface.0.nat_ip_address}
    runner.mydomainyouknow.fun ansible_host=${yandex_compute_instance.node_06.network_interface.0.nat_ip_address}

    [monitoring-node]
    monitoring.mydomainyouknow.fun ansible_host=${yandex_compute_instance.node_07.network_interface.0.nat_ip_address}

    DOC
  filename = "../../ansible/inventory"

  depends_on = [
    yandex_compute_instance.node_01,
    yandex_compute_instance.node_02,
    yandex_compute_instance.node_03,
    yandex_compute_instance.node_04,
    yandex_compute_instance.node_05,
    yandex_compute_instance.node_06,
    yandex_compute_instance.node_07
  ]
}
