
# Домашнее задание к занятию «Установка Kubernetes» - Мирошниченко Никита

### Цель задания

Установить кластер K8s.

### Чеклист готовности к домашнему заданию

1. Развёрнутые ВМ с ОС Ubuntu 20.04-lts.


### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция по установке kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/).
2. [Документация kubespray](https://kubespray.io/).

-----

### Задание 1. Установить кластер k8s с 1 master node

1. Подготовка работы кластера из 5 нод: 1 мастер и 4 рабочие ноды.
2. В качестве CRI — containerd.
3. Запуск etcd производить на мастере.
4. Способ установки выбрать самостоятельно.

#### Установка:

Для установки кластера выбрал Kubespray, т.к. установка производится все в автоматическом режиме с первоначальной настройкой кластера.

1. Поднял 5 нод на базе ОС Ubuntu LTS 24.04 в YC:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_0.jpg)

2. Копируем ssh ключ на 1-ю ноду, которая будет мастер-нодой:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_1.jpg)

3. Установливаем Python 3.12 venv:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_2.jpg)

4. Клонируем репозиторий Kubespray:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_3.jpg)

5. Активируем Python venv-окружение:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_4.jpg)

6. Устанавливаем через pip пакеты из requirements.txt:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_5.jpg)

7. Копируем директорию sample как mycluster и объявляем в переменной IPS - IP-адреса всех нод:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_6.jpg)

8. Устанавливаем библиотеки ruamel.yaml:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_7.jpg)

9. Конфигурием файл hosts.yaml c помощью скрипта inventory.py, передав переменную IPS:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_8.jpg)

10. Редактируем файл hosts.yaml для запуска ansible-playbook:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_9.jpg)

11. С помощью команды `ansible-playbook -i inventory/mycluster/hosts.yaml cluster.yml -b -v &` запускаем playbook и ожидаем окончания установки кластера:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_10.jpg)

12. Создаем директорию .kube, копируем конфиг в директорию, задаем владельца конфига и проверяем работу кластера командой `kubectl get nodes`:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/12/z1_11.jpg)

------

### Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl get nodes`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.
