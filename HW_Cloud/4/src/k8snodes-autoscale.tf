resource "yandex_kubernetes_node_group" "k8s-nodes" {
  name        = "k8s-nodes"
  description = "Test node group"
  cluster_id  = yandex_kubernetes_cluster.k8s-zones.id
  version     = "1.27"
  instance_template {
    name = "test-{instance.short_id}-{instance_group.id}"
    platform_id = "standard-v3"
    resources {
      cores         = 4
      core_fraction = 50
      memory        = 4
    }
    metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
    }
    boot_disk {
      size = 64
      type = "network-ssd"
    }
    network_acceleration_type = "standard"
    network_interface {
     subnet_ids = ["${yandex_vpc_subnet.public-a.id}"]
     nat = true
    }
    scheduling_policy {
      preemptible = true
    }
  }
  allocation_policy {
    location {
      zone = yandex_vpc_subnet.public-a.zone
   }
}

  scale_policy {
    auto_scale {
      min = 3
      max = 6
      initial = 3
    }
  }
  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true
    maintenance_window {
      start_time = "22:00"
      duration   = "10h"
    }
  }
  node_labels = {
    node-label1 = "node-value1"
  }
  node_taints = ["taint1=taint-value1:NoSchedule"]
  labels = {
    "template-label1" = "template-value1"
  }
  allowed_unsafe_sysctls = ["kernel.msg*", "net.core.somaxconn"]
}