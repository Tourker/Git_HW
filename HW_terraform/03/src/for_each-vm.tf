resource "yandex_compute_instance" "vm" {

  depends_on = [ yandex_compute_instance.web ]

  for_each = { for vm in var.each_vm: "${vm.vm_name}" => vm }
  name = each.key
  platform_id = "standard-v1"
  resources {
        cores         = each.value.cpu
        memory         = each.value.ram
        core_fraction  = each.value.frac
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = local.metadata_vm

}