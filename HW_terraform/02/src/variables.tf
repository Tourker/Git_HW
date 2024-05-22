/* ##cloud vars
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
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
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

variable "vm_web_resources_cores" {
  type        = number
  default     = "2"
  description = "VM cores"
}

variable "vm_web_resources_memory" {
  type        = number
  default     = "1"
  description = "VM memory"
}

#variable "vm_web_resources_core_fraction" {
  type        = number
  default     = "5"
  description = "VM cores"

}


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

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODENvz6JfqYL3YL6Hi2Ts9/MFkNcxbN+uNFOonEbyD4 tourk@vagrant"
  description = "ssh-keygen -t ed25519"
}
*/