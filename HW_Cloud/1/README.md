# Домашнее задание к занятию «Организация сети»

### Подготовка к выполнению задания

1. Домашнее задание состоит из обязательной части, которую нужно выполнить на провайдере Yandex Cloud, и дополнительной части в AWS (выполняется по желанию). 
2. Все домашние задания в блоке 15 связаны друг с другом и в конце представляют пример законченной инфраструктуры.  
3. Все задания нужно выполнить с помощью Terraform. Результатом выполненного домашнего задания будет код в репозитории. 
4. Перед началом работы настройте доступ к облачным ресурсам из Terraform, используя материалы прошлых лекций и домашнее задание по теме «Облачные провайдеры и синтаксис Terraform». Заранее выберите регион (в случае AWS) и зону.

---
### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.

 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

Resource Terraform для Yandex Cloud:

- [VPC subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet).
- [Route table](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_route_table).
- [Compute Instance](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance).

### Решение:

1. Поднял инфраструктуру через terraform:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/1/0.jpg)

2. Виртуальные машины:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/1/1.jpg)

3. Созданная VPC - vpchomework

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/1/2.jpg)

4. Созданные подсети - private и public:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/1/3.jpg)

5. Созданная таблица маршрутизации:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/1/4.jpg)

6. Проверка доступа к Интернету:

Проверка доступа у ВМ с публичным адресом (publicvm):

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/1/5_public.jpg)

Проверка доступа у ВМ с внутренним IP-адресом приватной сети (privatevm) через nat-instance:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/img/1/5_private.jpg)

### Исходный код terraform:

- [main.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/1/src/main.tf)
- [providers.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/1/src/providers.tf)
- [vms_platform.tf](https://github.com/Tourker/Git_HW/blob/main/HW_Cloud/1/src/vms_platform.tf)

---