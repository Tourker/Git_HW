
# Домашнее задание к занятию «Вычислительные мощности. Балансировщики нагрузки» - Мирошниченко Никита

### Подготовка к выполнению задания

1. Домашнее задание состоит из обязательной части, которую нужно выполнить на провайдере Yandex Cloud, и дополнительной части в AWS (выполняется по желанию). 
2. Все домашние задания в блоке 15 связаны друг с другом и в конце представляют пример законченной инфраструктуры.  
3. Все задания нужно выполнить с помощью Terraform. Результатом выполненного домашнего задания будет код в репозитории. 
4. Перед началом работы настройте доступ к облачным ресурсам из Terraform, используя материалы прошлых лекций и домашних заданий.

---
## Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.
 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.
4. (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

Полезные документы:

- [Compute instance group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance_group).
- [Network Load Balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer).
- [Группа ВМ с сетевым балансировщиком](https://cloud.yandex.ru/docs/compute/operations/instance-groups/create-with-balancer).

---


## Решение:

1. Создание инфраструктуры через terraform:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/2/1.jpg)

2. Созданная группа виртуальных машин:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/2/2.jpg)

3. Созданный бакет с загруженным изображением:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/2/3.jpg)

4. Проверка ссылки на бакет с изображением на каждом инстансе:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/2/4.jpg)

5. Созданный балансировщик нагрузки:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/2/5.jpg)

6. Проверка работаспособности балансировщика после отключения работы 2-х ВМ из группы:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/2/6.jpg)

### Исходный код terraform:

- [main.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/2/src/main.tf)
- [providers.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/2/src/providers.tf)
- [vms_platform.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/2/src/vms_platform.tf)
- [outputs.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/2/src/outputs.tf)
- [lb.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/2/src/lb.tf)
- [vms_instance.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/2/src/vms_instance.tf)
- [bucket.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/2/src/vms_instance.tf)

### Файл конфигурации метаданных Cloud-init.yaml

- [cloud-init.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/2/src/cloud-init.yaml)