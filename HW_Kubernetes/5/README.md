# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2» - Мирошниченко Никита

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к двум приложениям снаружи кластера по разным путям.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция](https://microk8s.io/docs/getting-started) по установке MicroK8S.
2. [Описание](https://kubernetes.io/docs/concepts/services-networking/service/) Service.
3. [Описание](https://kubernetes.io/docs/concepts/services-networking/ingress/) Ingress.
4. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/5/z1_1and2.jpg)

3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/5/z1_3.jpg)

4. Продемонстрировать, что приложения видят друг друга с помощью Service.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/5/z1_4.jpg)

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

#### Deployment frontend:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-frontend
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

```
#### Deployment backend:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-backend
  labels:
    app: dep_z1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: dep_z1
  template:
    metadata:
      labels:
        app: dep_z1
    spec:
      containers:
      - name: multitool
        image: wbitt/network-multitool:f23a085
        env:
        - name: HTTP_PORT
          value: "8080"

```
#### Service frontend:

```
apiVersion: v1
kind: Service
metadata:
  name: nginx-svc
spec:
  selector:
    app: dep_z1
  ports:
    - name: nginx
      protocol: TCP
      port: 80
      targetPort: 80
```
#### Service backend:
```
apiVersion: v1
kind: Service
metadata:
  name: multitool-svc
spec:
  selector:
    app: dep_z1
  ports:
    - name: multitool
      protocol: TCP
      port: 8080
      targetPort: 8080
```
------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/5/z2_1.jpg)

2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.

Прописал в etc/hosts домен для создания ingress:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/5/z2_2.jpg)

Созданнный Ingress:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/5/z2_3.jpg)


3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/5/z2_4.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/5/z2_5.jpg)

4. Предоставить манифесты и скриншоты или вывод команды п.2.

#### Ingress:

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: web-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: tourk-homework.ru
    http:
      paths:
      - path: /api
        pathType: Prefix
        backend:
          service:
            name: multitool-svc
            port:
              number: 8080
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx-svc
            port:
              number: 80
```

------
