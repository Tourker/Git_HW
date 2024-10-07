# Домашнее задание к занятию «Helm» - Мирошниченко Никита

### Цель задания

В тестовой среде Kubernetes необходимо установить и обновить приложения с помощью Helm.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение, например, MicroK8S.
2. Установленный локальный kubectl.
3. Установленный локальный Helm.
4. Редактор YAML-файлов с подключенным репозиторием GitHub.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция](https://helm.sh/docs/intro/install/) по установке Helm. [Helm completion](https://helm.sh/docs/helm/helm_completion/).

Скачиваем архив с официального сайта Helm:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/10/z0_dowload_helm.jpg)

Разархивируем и переносим файл helm в директорию usr/local/bin. Проверяем версию.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/10/z0_install_helm.jpg)

------

### Задание 1. Подготовить Helm-чарт для приложения

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения.
2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.
3. В переменных чарта измените образ приложения для изменения версии.

#### Подготовка chart:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/10/z1_1.jpg)

#### Запускаем chart:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/10/z1_2.jpg)

#### Меняем версию в Chart.yaml

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/10/z1_3.jpg)

#### Запуск другой версии приложения:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/10/z1_4.jpg)

Ссылка на [values.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/10/homework-chart/values.yaml)

Ссылка на [deployment_z1.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/10/homework-chart/templates/deployment_z1.yaml)

Ссылка на [service_z1.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/10/homework-chart/templates/service_z1.yaml)

Ссылка на [Chart.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/10/homework-chart/Chart.yaml)

------
### Задание 2. Запустить две версии в разных неймспейсах

1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.
2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.
3. Продемонстрируйте результат.

#### Запуск в namespace - app1:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/10/z2_1.jpg)

#### Запуск в namespace - app2:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/10/z2_2.jpg)

#### Kubectl get pods:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/10/z2_3.jpg)


### Правила приёма работы

1. Домашняя работа оформляется в своём Git репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl`, `helm`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.