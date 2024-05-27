output "vms" {
  value = {
    web = [
      for vm in yandex_compute_instance.web : {
        name = vm.name
        id   = vm.id
        fqdn = vm.fqdn
      }
    ],
    vm = {
      for vm in var.each_vm : vm["vm_name"] => {
        name  = yandex_compute_instance.vm[vm["vm_name"]]["name"]
        fqdn  = yandex_compute_instance.vm[vm["vm_name"]]["fqdn"]
        id    = yandex_compute_instance.vm[vm["vm_name"]]["id"]
      }
    },
    storage = {
      name = yandex_compute_instance.storage[*].name
      id   = yandex_compute_instance.storage[*].id
      fqdn = yandex_compute_instance.storage[*].fqdn
    }
  }
}