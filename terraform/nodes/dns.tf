resource "yandex_dns_zone" "public-zone" {
  name   = "my-public-zone"
  zone   = "${var.domain}."
  public = true
}

resource "yandex_dns_recordset" "dns01" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "${var.domain}."
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.node_01.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.node_01
  ]
}

resource "yandex_dns_recordset" "dns02" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "www"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.node_01.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.node_01
  ]
}

resource "yandex_dns_recordset" "dns03" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "gitlab"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.node_01.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.node_01
  ]
}

resource "yandex_dns_recordset" "dns04" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "grafana"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.node_01.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.node_01
  ]
}

resource "yandex_dns_recordset" "dns05" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "prometheus"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.node_01.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.node_01
  ]
}

resource "yandex_dns_recordset" "dns06" {
  zone_id = yandex_dns_zone.public-zone.id
  name    = "alertmanager"
  type    = "A"
  ttl     = 600
  data    = [yandex_compute_instance.node_01.network_interface.0.nat_ip_address]
  depends_on = [
    yandex_compute_instance.node_01
  ]
}
