variable "db_subnet_name" {
  type        = string
  default     = "develop_db"
  description = "subnet b name"
}

variable "vm_web_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image Ubuntu"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM name"
}
variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform id"
}

#variable "vm_web_resources_cores" {
#  type        = number
#  default     = "2"
#  description = "VM cores"
#}

#variable "vm_web_resources_memory" {
#  type        = number
#  default     = "1"
#  description = "VM memory"
#}

#variable "vm_web_resources_core_fraction" {
#  type        = number
#  default     = "5"
#  description = "VM cores"

#}


variable "vm_web_resources_preemptible" {
  type        = bool
  default     = "true"
  description = "VM preemptible"
}


variable "vm_web_resources_network_interface_nat" {
  type        = bool
  default     = "true"
  description = "VM vpc interface NAT"
}

###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODENvz6JfqYL3YL6Hi2Ts9/MFkNcxbN+uNFOonEbyD4 tourk@vagrant"
#  description = "ssh-keygen -t ed25519"
#}

variable "default_zone_2" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image Ubuntu"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform id"
}

#variable "vm_db_resources_cores" {
#  type        = number
#  default     = "2"
#  description = "VM cores"
#}

#variable "vm_db_resources_memory" {
#  type        = number
#  default     = "2"
#  description = "VM memory"
#}

#variable "vm_db_resources_core_fraction" {
#  type        = number
#  default     = "20"
#  description = "VM cores"
#}

variable "vm_db_resources_preemptible" {
  type        = bool
  default     = "true"
  description = "VM preemptible"
}

}

variable "develop" {
  type        = string
  default     = "develop"
  description = "develop name"
}

variable "vm_role_web" {
  type        = string
  default     = "web"
  description = "VM Wev role"
}

variable "vm_role_db" {
  type        = string
  default     = "db"
  description = "VM DB role"
}

variable "vms_resources" {
  type       = map
  default = {
    web = {
    cores="2"
    memory="1"
    core_fraction="5"
    },
    db = {
    cores="2"
    memory="2"
    core_fraction="20"
   }
  }
}

variable "metadata_map" {
  type = map(object({
  serial-port-enable = number
  ssh-keys = string}))
  default = {
    metadata = {
    serial-port-enable = 1
    ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODENvz6JfqYL3YL6Hi2Ts9/MFkNcxbN+uNFOonEbyD4 tourk@vagrant"
               }
    }
}
