# Домашнее задание к занятию «Запуск приложений в K8S» - Мирошниченко Никита

### Цель задания

В тестовой среде для работы с Kubernetes, установленной в предыдущем ДЗ, необходимо развернуть Deployment с приложением, состоящим из нескольких контейнеров, и масштабировать его.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) Deployment и примеры манифестов.
2. [Описание](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) Init-контейнеров.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_1_1.jpg)

2. После запуска увеличить количество реплик работающего приложения до 2.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_2_1.jpg)

3. Продемонстрировать количество подов до и после масштабирования.
До: 

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_1_2.jpg)

После: 

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_2_2.jpg)

4. Создать Service, который обеспечит доступ до реплик приложений из п.1.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_3_1.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_3_2.jpg)

5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_3_3.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_3_6.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_3_5.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z1_3_4.jpg)

------

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z2_1.jpg)

2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
3. Создать и запустить Service. Убедиться, что Init запустился.
4. Продемонстрировать состояние пода до и после запуска сервиса.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z2_2.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z2_3.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z2_4.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/3/z2_5.jpg)

------