# Домашнее задание к занятию «Управление доступом» - Мирошниченко Никита

### Цель задания

В тестовой среде Kubernetes нужно предоставить ограниченный доступ пользователю.

------

### Чеклист готовности к домашнему заданию

1. Установлено k8s-решение, например MicroK8S.
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым github-репозиторием.

------

### Инструменты / дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) RBAC.
2. [Пользователи и авторизация RBAC в Kubernetes](https://habr.com/ru/company/flant/blog/470503/).
3. [RBAC with Kubernetes in Minikube](https://medium.com/@HoussemDellai/rbac-with-kubernetes-in-minikube-4deed658ea7b).

------

### Задание 1. Создайте конфигурацию для подключения пользователя

1. Создайте и подпишите SSL-сертификат для подключения к кластеру.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/9/z1_1.jpg)

2. Настройте конфигурационный файл kubectl для подключения.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/9/z1_2.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/9/z1_3.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/9/z1_4.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/9/z1_5.jpg)

3. Создайте роли и все необходимые настройки для пользователя.

#### role.yaml:

```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: homework-role
  namespace: default
rules:
- apiGroups: [""]
  resources: ["pods", "pods/log"]
  verbs: ["watch", "list", "get"]

```
#### role-binging.yaml:

```
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: watch-log
  namespace: default
subjects:
- kind: User
  name: tourk
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: homework-role
  apiGroup: rbac.authorization.k8s.io

```


4. Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (`kubectl logs pod <pod_id>`, `kubectl describe pod <pod_id>`).

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/9/z1_6.jpg)



5. Предоставьте манифесты и скриншоты и/или вывод необходимых команд.

------

