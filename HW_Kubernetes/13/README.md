# Домашнее задание к занятию «Как работает сеть в K8s» - Мирошниченко Никита

### Цель задания

Настроить сетевую политику доступа к подам.

### Чеклист готовности к домашнему заданию

1. Кластер K8s с установленным сетевым плагином Calico.

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Документация Calico](https://www.tigera.io/project-calico/).
2. [Network Policy](https://kubernetes.io/docs/concepts/services-networking/network-policies/).
3. [About Network Policy](https://docs.projectcalico.org/about/about-network-policy).

-----

### Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа

1. Создать deployment'ы приложений frontend, backend и cache и соответсвующие сервисы.
2. В качестве образа использовать network-multitool.
3. Разместить поды в namespace App.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/13/z1_1.jpg)

4. Создать политики, чтобы обеспечить доступ frontend -> backend -> cache. Другие виды подключений должны быть запрещены.
5. Продемонстрировать, что трафик разрешён и запрещён.

Правило блокировки всего трафика:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/13/z1_2.jpg)

Проверяем что трафик запрещен:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/13/z1_deny_from_backend.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/13/z1_deny_from_cache.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/13/z1_deny_from_frontend.jpg)

Разрешаем трафик frontend > backend > cache:

Проверка из frontend в backend:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/13/z1_allow_from_fronted_to_backend.jpg)

Проверка из backend в cache:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/13/z1_allow_from_backend_to_cache.jpg)

#### Deployments:

[backend](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/backend.yaml)

[frontend](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/frontend.yaml)

[cache](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/cache.yaml)

#### Services:

[svc-backend](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/svc-backend.yaml)

[svc-frontend](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/svc-frontend.yaml)

[svc-cache](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/svc-cache.yaml)

#### Policies:

[policy-backend](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/policy-backend.yaml)

[policy-frontend](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/policy-frontend.yaml)

[policy-cache](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/policy-cache.yaml)

[policy-block](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/13/policy-block.yaml)

### Правила приёма работы

1. Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.