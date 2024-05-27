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

variable "vms_resources" {
  type       = map
  default= {
    cores    ="2"
    memory   ="1"
    core_fraction="20"
  }
}

variable "each_vm" {
  type = list(object({vm_name=string, cpu=number, ram=number, disk_volume=number, frac=number }))
  default = [
  {
  vm_name     = "main"
  cpu         = 2
  ram         = 2
  disk_volume = 5
  frac        = 20
  },
  {
  vm_name     = "replica"
  cpu         = 4
  ram         = 4
  disk_volume = 10
  frac        = 5
  }
  ]
}