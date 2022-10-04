output "internal_ip_address_node_01" {
  value = "${yandex_compute_instance.node_01.network_interface.0.ip_address}"
}

output "external_ip_address_node_01" {
  value = "${yandex_compute_instance.node_01.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node_02" {
  value = "${yandex_compute_instance.node_02.network_interface.0.ip_address}"
}

output "external_ip_address_node_02" {
  value = "${yandex_compute_instance.node_02.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node_03" {
  value = "${yandex_compute_instance.node_03.network_interface.0.ip_address}"
}

output "external_ip_address_node_03" {
  value = "${yandex_compute_instance.node_03.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node_04" {
  value = "${yandex_compute_instance.node_04.network_interface.0.ip_address}"
}

output "external_ip_address_node_04" {
  value = "${yandex_compute_instance.node_04.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node_05" {
  value = "${yandex_compute_instance.node_05.network_interface.0.ip_address}"
}

output "external_ip_address_node_05" {
  value = "${yandex_compute_instance.node_05.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node_06" {
  value = "${yandex_compute_instance.node_06.network_interface.0.ip_address}"
}

output "external_ip_address_node_06" {
  value = "${yandex_compute_instance.node_06.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node_07" {
  value = "${yandex_compute_instance.node_07.network_interface.0.ip_address}"
}

output "external_ip_address_node_07" {
  value = "${yandex_compute_instance.node_07.network_interface.0.nat_ip_address}"
}