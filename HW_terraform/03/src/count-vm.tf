data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_compute_image
}
resource "yandex_compute_instance" "web" {
  count = 2
  name = "${var.vm_web_name}-${count.index + 1}"
  resources {
    cores         = "${var.vms_resources["cores"]}"
    memory        = "${var.vms_resources["memory"]}"
    core_fraction = "${var.vms_resources["core_fraction"]}"
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  
  scheduling_policy { 
    preemptible = true 
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}