output "vm_info" {

value = [
 { web = [ yandex_compute_instance.platform.name,yandex_compute_instance.platform.fqdn,yandex_compute_instance.platform.network_interface.0.nat_ip_address ] },
 { db = [ yandex_compute_instance.platform_db.name,yandex_compute_instance.platform_db.fqdn,yandex_compute_instance.platform_db.network_interface.0.nat_ip_address ] },
]
}