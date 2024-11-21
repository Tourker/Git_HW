#Создание VPC

resource "yandex_vpc_network" "vpchomework" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "public" {
  name           = var.public_subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vpchomework.id
  v4_cidr_blocks = var.default_cidr
}
#Создание подсетей

resource "yandex_vpc_subnet" "public-a" {
  name           = "public-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.vpchomework.id
  v4_cidr_blocks = ["10.1.0.0/16"]
  #route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

resource "yandex_vpc_subnet" "public-b" {
  name           = "public-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.vpchomework.id
  v4_cidr_blocks = ["10.2.0.0/16"]
  #route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

resource "yandex_vpc_subnet" "public-d" {
  name           = "public-d"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.vpchomework.id
  v4_cidr_blocks = ["10.3.0.0/16"]
  #route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

resource "yandex_vpc_subnet" "private-a" {
  name           = "private-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.vpchomework.id
  v4_cidr_blocks = var.default_cidr_2
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

resource "yandex_vpc_subnet" "private-b" {
  name           = "private-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.vpchomework.id
  v4_cidr_blocks = var.default_cidr_3
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
}