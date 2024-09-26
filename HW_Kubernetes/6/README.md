# Домашнее задание к занятию «Хранение в K8s. Часть 1» - Мирошниченко Никита

### Цель задания

В тестовой среде Kubernetes нужно обеспечить обмен файлами между контейнерам пода и доступ к логам ноды.

------

### Чеклист готовности к домашнему заданию

1. Установленное K8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключенным GitHub-репозиторием.

------

### Дополнительные материалы для выполнения задания

1. [Инструкция по установке MicroK8S](https://microk8s.io/docs/getting-started).
2. [Описание Volumes](https://kubernetes.io/docs/concepts/storage/volumes/).
3. [Описание Multitool](https://github.com/wbitt/Network-MultiTool).

------

### Задание 1 

**Что нужно сделать**

Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
3. Обеспечить возможность чтения файла контейнером multitool.
4. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.
5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.

#### Deployment: 

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-z1
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
      - name: busybox
        image: busybox
        command: ['sh', '-c', 'while true; do echo My first volume in k8s! >> /data/success.txt && sleep 5; done']
        volumeMounts:
          - name: vol
            mountPath: /data
      - name: multitool
        image: wbitt/network-multitool:f23a085
        env:
        - name: HTTP_PORT
          value: "1000"
        volumeMounts:
          - name: vol
            mountPath: /data
      volumes:
      - name: vol
        hostPath:
          path: /var/data

```
Демонстрация записи файла Success в контейнере Multitool:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/6/z1.jpg)


------

### Задание 2

**Что нужно сделать**

Создать DaemonSet приложения, которое может прочитать логи ноды.

1. Создать DaemonSet приложения, состоящего из multitool.
2. Обеспечить возможность чтения файла `/var/log/syslog` кластера MicroK8S.
3. Продемонстрировать возможность чтения файла изнутри пода.
4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.

#### DaemonSet:

```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: daemonset-z1
  labels:
    app: dem_z1
spec:
  selector:
    matchLabels:
      app: dem_z1
  template:
    metadata:
      labels:
        app: dem_z1
    spec:
      containers:
      - name: multitool
        image: wbitt/network-multitool:f23a085
        env:
        - name: HTTP_PORT
          value: "1000"
        volumeMounts:
          - name: vol
            mountPath: /data
      volumes:
      - name: vol
        hostPath:
          path: /var/log/

```

Демонстрация отображения логов Ноды в поде:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/6/z2.jpg)


------