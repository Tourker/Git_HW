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
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
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

variable "vms_ssh_root_key" {
  type        = string
  default     = "*********************************"
  description = "ssh-keygen -t ed25519"
}

variable "access_key" {
  type        = string
  default     = "***********************"
  description = "service account access key"
}

variable "secret_key" {
  type        = string
  default     = "**********************"
  description = "service account secret key"
}