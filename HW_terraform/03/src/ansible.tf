resource "local_file" "hosts_template" {
  content = templatefile("${path.module}/hosts.tftpl",

  { webservers = yandex_compute_instance.web,
    vm = yandex_compute_instance.vm,
    storage = [yandex_compute_instance.storage] })

  filename = "${abspath(path.module)}/hosts.cfg"
}