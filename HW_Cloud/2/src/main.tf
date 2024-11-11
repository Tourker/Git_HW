#Создание VPC

resource "yandex_vpc_network" "vpchomework" {
  name = var.vpc_name
}

#Создание подсети

resource "yandex_vpc_subnet" "public" {
  name           = var.public_subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vpchomework.id
  v4_cidr_blocks = var.default_cidr
}