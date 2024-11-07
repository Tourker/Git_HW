#Создание VPC

resource "yandex_vpc_network" "vpchomework" {
  name = var.vpc_name
}

#Создание подсетей

resource "yandex_vpc_subnet" "public" {
  name           = var.public_subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vpchomework.id
  v4_cidr_blocks = var.default_cidr
  #route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

resource "yandex_vpc_subnet" "private" {
  name           = var.private_subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vpchomework.id
  v4_cidr_blocks = var.default_cidr_2
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

#Создание инстансов

data "yandex_compute_image" "ubuntu" {
  family = var.vm_public_compute_image
}

resource "yandex_compute_instance" "publicvm" {
  name        = var.vm_public_name
  platform_id = var.vm_public_platform_id
  zone        = var.default_zone
  resources {
    cores         = var.vm_public_resources_cores
    memory        = var.vm_public_resources_memory
    core_fraction = var.vm_public_resources_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
scheduling_policy {
    preemptible = var.vm_public_resources_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = var.vm_public_resources_network_interface_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "privatevm" {
  name        = var.vm_private_name
  platform_id = var.vm_private_platform_id
  zone     =    var.default_zone
  resources {
    cores         = var.vm_private_resources_cores
    memory        = var.vm_private_resources_memory
    core_fraction = var.vm_private_resources_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_private_resources_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "nat-instance" {
  name        = "nat-instance"
  platform_id = var.vm_public_platform_id
  zone        = var.default_zone
  resources {
    cores         = var.vm_public_resources_cores
    memory        = var.vm_public_resources_memory
    core_fraction = var.vm_public_resources_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
    }
  }
scheduling_policy {
    preemptible = var.vm_public_resources_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    ip_address = "192.168.10.254"
    nat       = var.vm_public_resources_network_interface_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

#Создание таблицы маршрутизации

resource "yandex_vpc_route_table" "nat-instance-route" {
  name       = "nat-instance-route"
  network_id = yandex_vpc_network.vpchomework.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}
