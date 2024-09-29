# Домашнее задание к занятию «Хранение в K8s. Часть 2» - Мирошниченко Никита

### Цель задания

В тестовой среде Kubernetes нужно создать PV и продемострировать запись и хранение файлов.

------

### Чеклист готовности к домашнему заданию

1. Установленное K8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключенным GitHub-репозиторием.

------

### Дополнительные материалы для выполнения задания

1. [Инструкция по установке NFS в MicroK8S](https://microk8s.io/docs/nfs). 
2. [Описание Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/). 
3. [Описание динамического провижининга](https://kubernetes.io/docs/concepts/storage/dynamic-provisioning/). 
4. [Описание Multitool](https://github.com/wbitt/Network-MultiTool).

------

### Задание 1

**Что нужно сделать**

Создать Deployment приложения, использующего локальный PV, созданный вручную.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/7/z1_1and2.jpg)

3. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории. 

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/7/z1_3.jpg)

4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/7/z1_4.jpg)

V остался, т.к. PV - это постоянный том выделенный на ноде, а PVC - это связка (запрос) для PV и влияет только на запросы к ресурсам.

5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV.  Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.

Идем на ноду и убеждаемся, что файл остался: 

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/7/z1_5.jpg)

Удаляем PV и смотрим, что произошло:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/7/z1_6.jpg)

Файл не удалился, т.к. установлен параметр политики ReclaimPolicy: Retain. Это говорит нам о том, что данные на томе автоматически не удаляются даже при удалении самого PV. Только вручную.

5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

#### deployment.yaml:

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
        persistentVolumeClaim:
          claimName: pvc-homework

```

#### pv-homework.yaml:

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-homework
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: ""
  hostPath:
    path: "/mnt/data/"
```

#### pvc-homework.yaml:

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-homework
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: ""
  resources:
    requests:
      storage: 1Gi

```
------

### Задание 2

**Что нужно сделать**

Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.

1. Включить и настроить NFS-сервер на MicroK8S.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/7/z2_1.jpg)

2. Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/7/z2_2.jpg)

3. Продемонстрировать возможность чтения и записи файла изнутри пода. 

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/7/z2_3.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/7/z2_4.jpg)

4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

#### deployment-nfs.yaml:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-z2
  labels:
    app: dep_z2
spec:
  replicas: 1
  selector:
    matchLabels:
      app: dep_z2
  template:
    metadata:
      labels:
        app: dep_z2
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
        persistentVolumeClaim:
          claimName: pvc-nfs
```

#### pvc-nfs.yaml:

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-nfs
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: "microk8s-hostpath"
  resources:
    requests:
      storage: 1Gi
```

------