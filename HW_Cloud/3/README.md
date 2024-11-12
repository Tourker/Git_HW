# Домашнее задание к занятию «Безопасность в облачных провайдерах»  

Используя конфигурации, выполненные в рамках предыдущих домашних заданий, нужно добавить возможность шифрования бакета.

---
## Задание 1. Yandex Cloud   

1. С помощью ключа в KMS необходимо зашифровать содержимое бакета:

 - создать ключ в KMS;
 - с помощью ключа зашифровать содержимое бакета, созданного ранее.
2. (Выполняется не в Terraform)* Создать статический сайт в Object Storage c собственным публичным адресом и сделать доступным по HTTPS:

 - создать сертификат;
 - создать статическую страницу в Object Storage и применить сертификат HTTPS;
 - в качестве результата предоставить скриншот на страницу с сертификатом в заголовке (замочек).

Полезные документы:

- [Настройка HTTPS статичного сайта](https://cloud.yandex.ru/docs/storage/operations/hosting/certificate).
- [Object Storage bucket](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/storage_bucket).
- [KMS key](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kms_symmetric_key).

--- 

## Решение:

1. Создание KMS-ключа в terraform:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/3/z1_0_ter_key.jpg)

2. Подвязывание KMS-ключа к бакету в terraform:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/3/z1_1_ter_key.jpg)

3. Созданный ключ:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/3/z1_KMS.jpg)

4. Созданный бакет с ключом шифрования:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/3/z1_bucket_with_key.jpg)

5. Проверка доступа к бакету:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/3/z1_check_access.jpg)

6. Создание сертификата в YC:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/3/z2_0.jpg)

7. Создание статичного веб-сайта:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/3/z2_1.jpg)

8. Проверка https:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/3/z2_2.jpg)


### Исходный код terraform:

- [bucket.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/3/src/bucket.tf)