# Создание бакета с использованием ключа

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
# Использование созданного ключа KMS
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-test.id
        sse_algorithm     = "aws:kms"
      }
    }
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

# Создание kms-симметричного ключа

resource "yandex_kms_symmetric_key" "key-test" {
  name              = "bucket-key-test"
  default_algorithm = "AES_128"
  rotation_period   = "8760h"
}