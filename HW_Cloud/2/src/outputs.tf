output "load_balancer_public_ip" {
  description = "Public IP address of load balancer"
  value = yandex_lb_network_load_balancer.lb-1.listener.*.external_address_spec[0].*.address
}

output "vms" {
  description = "INFO VMS"
  value = {
    vm_1 = {
      name              = yandex_compute_instance_group.ig-1.instances.0.name
      ip_address        = yandex_compute_instance_group.ig-1.instances.0.network_interface.0.ip_address
      public_ip_address = yandex_compute_instance_group.ig-1.instances.0.network_interface.0.nat_ip_address
      },
    vm_2 = {
      name              = yandex_compute_instance_group.ig-1.instances.1.name
      ip_address        = yandex_compute_instance_group.ig-1.instances.1.network_interface.0.ip_address
      public_ip_address = yandex_compute_instance_group.ig-1.instances.1.network_interface.0.nat_ip_address
      },
    vm_3 = {
      name              = yandex_compute_instance_group.ig-1.instances.2.name
      ip_address        = yandex_compute_instance_group.ig-1.instances.2.network_interface.0.ip_address
      public_ip_address = yandex_compute_instance_group.ig-1.instances.2.network_interface.0.nat_ip_address
    }
  }
}