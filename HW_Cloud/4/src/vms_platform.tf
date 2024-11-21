###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_0" {
  type        = list(string)
  default     = ["192.168.11.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_2" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_3" {
  type        = list(string)
  default     = ["192.168.30.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_4" {
  type        = list(string)
  default     = ["192.168.40.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "vpchomework"
  description = "VPC network & subnet name"
}

variable "public_subnet_name" {
  type       = string
  default    = "public"
}

variable "private_a_subnet_name" {
  type        = string
  default     = "private-a"
  description = "subnet private name"
}

variable "private_b_subnet_name" {
  type        = string
  default     = "private-b"
  description = "subnet private name"
}

variable "private_d_subnet_name" {
  type        = string
  default     = "private-d"
  description = "subnet private name"
}

variable "vm_public_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image Ubuntu"
}

variable "vm_public_name" {
  type        = string
  default     = "publicvm"
  description = "VM name"
}
variable "vm_public_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform id"
}

variable "vm_public_resources_cores" {
  type        = number
  default     = "2"
  description = "VM cores"
}

variable "vm_public_resources_memory" {
  type        = number
  default     = "2"
  description = "VM memory"
}

variable "vm_public_resources_core_fraction" {
  type        = number
  default     = "20"
  description = "VM cores"
}

variable "vm_public_resources_preemptible" {
  type        = bool
  default     = "true"
  description = "VM preemptible"
}

variable "vm_public_resources_network_interface_nat" {
  type        = bool
  default     = "true"
  description = "VM vpc interface NAT"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 **************************"
  description = "ssh-keygen -t ed25519"
}

variable "default_zone_2" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_private_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image Ubuntu"
}

variable "vm_private_name" {
  type        = string
  default     = "privatevm"
  description = "VM name"
}

variable "vm_private_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform id"
}

variable "vm_private_resources_cores" {
  type        = number
  default     = "2"
  description = "VM cores"
}

variable "vm_private_resources_memory" {
  type        = number
  default     = "2"
  description = "VM memory"
}

variable "vm_private_resources_core_fraction" {
  type        = number
  default     = "20"
  description = "VM cores"
}

variable "vm_private_resources_preemptible" {
  type        = bool
  default     = "true"
  description = "VM preemptible"
}

variable "vm_private_resources_network_interface_nat" {
  type        = bool
  default     = "true"
  description = "VM vpc interface NAT"
}