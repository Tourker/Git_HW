resource "yandex_compute_disk" "storage_vm" {
  count   = 3
  name  = "disk-${count.index + 1}"
  size  = 1
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
  resources {
    cores = 2
    memory = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
    image_id = data.yandex_compute_image.ubuntu.image_id
        }
  }

  dynamic "secondary_disk" {
     for_each = { for st in yandex_compute_disk.storage_vm[*]: st.name=> st }
     content {
     disk_id = secondary_disk.value.id
   }
  }
  network_interface {
     subnet_id = yandex_vpc_subnet.develop.id
     nat     = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }
}