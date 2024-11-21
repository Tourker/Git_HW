resource "yandex_mdb_mysql_cluster" "test-sql" {
  name                = "mysql"
  environment         = "PRESTABLE"
  network_id          = yandex_vpc_network.vpchomework.id
  version             = "8.0"
  deletion_protection = "true"

  maintenance_window {
    type = "ANYTIME"
  }
  backup_window_start {
    hours   = 23
    minutes = 59
  }
  resources {
    resource_preset_id = "b1.medium"
    disk_type_id       = "network-ssd"
    disk_size          = "20"
  }

  host {
    zone             = "ru-central1-a"
    subnet_id        = yandex_vpc_subnet.private-a.id
  }
  host {
    zone             = "ru-central1-b"
    subnet_id        = yandex_vpc_subnet.private-b.id
  }
}


resource "yandex_mdb_mysql_database" "netology-db" {
  cluster_id = yandex_mdb_mysql_cluster.test-sql.id
  name       = "netology_db"
}

resource "yandex_mdb_mysql_user" "netology" {
  cluster_id = yandex_mdb_mysql_cluster.test-sql.id
  name       = "netology"
  password   = "netology"
  permission {
    database_name = yandex_mdb_mysql_database.netology-db.name
    roles         = ["ALL"]
  }
}