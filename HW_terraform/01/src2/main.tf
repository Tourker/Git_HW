terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=0.13" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {
  host     = "ssh://tourk@51.250.94.171:22"
}

#однострочный комментарий

resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "example_${random_password.random_string.result}"
  env = [
    "MYSQL_ROOT_PASSWORD=example_${random_password.random_string.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=example_${random_password.random_string.result}",
    "MYSQL_ROOT_HOST=%"
  ]
  ports {
    internal = 3306
    external = 3306
  }
}
