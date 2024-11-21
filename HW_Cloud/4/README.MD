# Домашнее задание к занятию «Кластеры. Ресурсы под управлением облачных провайдеров»

### Цели задания 

1. Организация кластера Kubernetes и кластера баз данных MySQL в отказоустойчивой архитектуре.
2. Размещение в private подсетях кластера БД, а в public — кластера Kubernetes.

---
## Задание 1. Yandex Cloud

1. Настроить с помощью Terraform кластер баз данных MySQL.

 - Используя настройки VPC из предыдущих домашних заданий, добавить дополнительно подсеть private в разных зонах, чтобы обеспечить отказоустойчивость. 
 - Разместить ноды кластера MySQL в разных подсетях.
 - Необходимо предусмотреть репликацию с произвольным временем технического обслуживания.
 - Использовать окружение Prestable, платформу Intel Broadwell с производительностью 50% CPU и размером диска 20 Гб.
 - Задать время начала резервного копирования — 23:59.
 - Включить защиту кластера от непреднамеренного удаления.
 - Создать БД с именем `netology_db`, логином и паролем.

#### Решение

1) Созданный кластер в сервисе Managed Service for MySQL:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z1_1.jpg)

2) База данных:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z1_2.jpg)

3) Пользователь БД:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z1_3.jpg)

4) Хосты:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z1_4.jpg)

5) Топология:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z1_5.jpg)

6) Проверка подключения на тестовой ВМ:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z1_6.jpg)

---

2. Настроить с помощью Terraform кластер Kubernetes.

 - Используя настройки VPC из предыдущих домашних заданий, добавить дополнительно две подсети public в разных зонах, чтобы обеспечить отказоустойчивость.
 - Создать отдельный сервис-аккаунт с необходимыми правами. 
 - Создать региональный мастер Kubernetes с размещением нод в трёх разных подсетях.
 - Добавить возможность шифрования ключом из KMS, созданным в предыдущем домашнем задании.
 - Создать группу узлов, состояющую из трёх машин с автомасштабированием до шести.
 - Подключиться к кластеру с помощью `kubectl`.
 - *Запустить микросервис phpmyadmin и подключиться к ранее созданной БД.
 - *Создать сервис-типы Load Balancer и подключиться к phpmyadmin. Предоставить скриншот с публичным адресом и подключением к БД.

#### Решение

1) Созданный кластер в сервисе Managed Service for Kubernetes:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z2_1.jp)

2) Группа узлов:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z2_2.jpg)

3) KMS-key:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z2_3.jpg)

4) Сервисный аккаунт с ролями:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z2_4.jpg)

5) Проверка подключения к кластеру:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z2_5.jpg)

Дополнение к домашней работе:

Заметил, что выдается ошибка при при попытке создания группы нодов в разных зонах в режиме автомасштабирования - создать можно только одной зоне (возможно ограничение по гранту?). Поэтому для проверки создал еще отдельно группу узлов с фиксированным значением ВМ (fixed_scale). ВМ создались в разных зонах, но зависает на статусе Provisioning.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z2_6.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z2_7.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/4/z2_8.jpg)


---

### Исходный код terraform:

- [k8snodes-autoscale.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/4/src/k8snodes-autoscale.tf)

- [k8snodes-fixedscale.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/4/src/k8snodes-fixedscale.tf)

- [main.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/4/src/main.tf)

- [myk8scluster.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/4/src/myk8scluster.tf)

- [mysqlcluster.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/4/src/mysqlcluster.tf)

- [providers.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/4/src/providers.tf)

- [vms_platform.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/4/src/vms_platform.tf)


Полезные документы:

- [MySQL cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_cluster).
- [Создание кластера Kubernetes](https://cloud.yandex.ru/docs/managed-kubernetes/operations/kubernetes-cluster/kubernetes-cluster-create)
- [K8S Cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster).
- [K8S node group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_node_group).

--- 