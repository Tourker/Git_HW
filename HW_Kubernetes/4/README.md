# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1» - Мирошниченко Никита

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к приложению, установленному в предыдущем ДЗ и состоящему из двух контейнеров, по разным портам в разные контейнеры как внутри кластера, так и снаружи.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) Deployment и примеры манифестов.
2. [Описание](https://kubernetes.io/docs/concepts/services-networking/service/) Описание Service.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/4/z1_1.jpg)

2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/4/z1_2.jpg)

3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.

Создание Pod'a - multitool:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/4/z1_3_1.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/4/z1_3_2.jpg)

4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/4/z1_4.jpg)

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.


#### Deployment:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-z1
  labels:
    app: dep_z1
spec:
  replicas: 3
  selector:
    matchLabels:
      app: dep_z1
  template:
    metadata:
      labels:
        app: dep_z1
    spec:
      containers:
      - name: nginx
        image: nginx:latest
      - name: multitool
        image: wbitt/network-multitool:f23a085
        env:
        - name: HTTP_PORT
          value: "8080"
```

### Service:

```
apiVersion: v1
kind: Service
metadata:
  name: nginx-web
spec:
  selector:
    app: dep_z1
  ports:
    - name: nginx
      protocol: TCP
      port: 9001
      targetPort: 80
    - name: multitool
      protocol: TCP
      port: 9002
      targetPort: 8080
```

------

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/4/z2_1.jpg)


2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/4/z2_2.jpg)

3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.

#### Service: 

```
apiVersion: v1
kind: Service
metadata:
  name: nginx-web-node
spec:
  selector:
    app: dep_z1
  ports:
    - name: nginx
      protocol: TCP
      port: 9001
      targetPort: 80
      nodePort: 30100
    - name: multitool
      protocol: TCP
      port: 9002
      targetPort: 8080
      nodePort: 30101
  type: NodePort
```

------