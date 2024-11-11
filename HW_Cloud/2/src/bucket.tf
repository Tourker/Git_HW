resource "yandex_storage_bucket" "test" {
  access_key            = var.access_key
  secret_key            = var.secret_key
  bucket                = "test-netology-bucket"
  default_storage_class = "standard"
  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }
}

# Загрузка файла с картинкой
resource "yandex_storage_object" "test-object" {
  access_key = var.access_key
  secret_key = var.secret_key
  bucket     = "test-netology-bucket"
  key        = "image-test.jpg"
  source     = "./img/img.jpg"
}