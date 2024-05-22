resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = var.db_subnet_name
  zone           = var.default_zone_2
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_2
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_compute_image
}

resource "yandex_compute_instance" "platform" {
  name        = local.name_web
  platform_id = var.vm_web_platform_id
  zone        = var.default_zone
  resources {
    cores         = var.vm_web_resources_cores
    memory        = var.vm_web_resources_memory
    core_fraction = var.vm_web_resources_core_fraction
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

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "platform_db" {
  name        = local.name_db
  platform_id = var.vm_db_platform_id
  zone     =    var.default_zone_2
  resources {
    cores         = var.vm_db_resources_cores
    memory        = var.vm_db_resources_memory
    core_fraction = var.vm_db_resources_core_fraction
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

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}