resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = var.db_subnet_name
  zone           = var.default_zone_2
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_2
  route_table_id = yandex_vpc_route_table.rt.id
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_compute_image
}

resource "yandex_compute_instance" "platform" {
  name        = local.name_web
  platform_id = var.vm_web_platform_id
  zone        = var.default_zone
  resources {
    cores         = var.vms_resources.web["cores"]
    memory        = var.vms_resources.web["memory"]
    core_fraction = var.vms_resources.web["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_resources_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_resources_network_interface_nat
  }

  metadata = var.metadata_map["metadata"]

}

resource "yandex_compute_instance" "platform_db" {
  name        = local.name_db
  platform_id = var.vm_db_platform_id
  zone     =    var.default_zone_2
  resources {
    cores         = var.vms_resources.db["cores"]
    memory        = var.vms_resources.db["memory"]
    core_fraction = var.vms_resources.db["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_resources_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_db_resources_network_interface_nat
  }

  metadata = var.metadata_map["metadata"]

}

resource "yandex_vpc_gateway" "nat_gateway" {
  name = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  name       = "test-route-table"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}