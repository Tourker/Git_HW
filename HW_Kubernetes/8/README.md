# Домашнее задание к занятию «Конфигурация приложений» - Мирошниченко Никита

### Цель задания

В тестовой среде Kubernetes необходимо создать конфигурацию и продемонстрировать работу приложения.

------

### Чеклист готовности к домашнему заданию

1. Установленное K8s-решение (например, MicroK8s).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым GitHub-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/configuration/secret/) Secret.
2. [Описание](https://kubernetes.io/docs/concepts/configuration/configmap/) ConfigMap.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

1. Создать Deployment приложения, состоящего из контейнеров nginx и multitool.
2. Решить возникшую проблему с помощью ConfigMap.
3. Продемонстрировать, что pod стартовал и оба конейнера работают.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/8/z1_1.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/8/z1_2.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/8/z1_3.jpg)

4. Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/8/z1_4.jpg)

5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

#### deployment.yaml

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
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
        volumeMounts:
        - name: api-html
          mountPath: /usr/share/nginx/html
      - name: multitool
        image: wbitt/network-multitool:f23a085
        env:
        - name: HTTP_PORT
          valueFrom:
            configMapKeyRef:
              name: env-config
              key: env
      volumes:
      - name: api-html
        configMap:
          name: api-html
```
#### configmap-env.yaml

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: env-config
data:
  env: "1000"
```
#### svc.yaml

```
apiVersion: v1
kind: Service
metadata:
  name: dep-svc
spec:
  selector:
    app: dep_z1
  ports:
    - name: nginx
      protocol: TCP
      port: 80
      targetPort: 80
    - name: multitool
      protocol: TCP
      port: 1000
      targetPort: 1000
```
#### config-map-nginx.yaml

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: api-html
data:
  index.html: |
    <html>
    <body>
      <h1>HELLO</h1>
    </body>
    </html>
```


------

### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS 

1. Создать Deployment приложения, состоящего из Nginx.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/8/z2_1.jpg)

2. Создать собственную веб-страницу и подключить её как ConfigMap к приложению.
3. Выпустить самоподписной сертификат SSL. Создать Secret для использования сертификата.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/8/z2_3_1.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/8/z2_3_2.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/8/z2_3_3.jpg)

4. Создать Ingress и необходимый Service, подключить к нему SSL в вид. Продемонстировать доступ к приложению по HTTPS. 

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/8/z2_4.jpg)

5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

#### deployment_z2.yaml

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
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
        - containerPort: 443
        volumeMounts:
        - name: api-html
          mountPath: /usr/share/nginx/html
        env:
        - name: HTTP_PORT
          value: "80"
        - name: HTTPS_PORT
          value: "443"
      volumes:
      - name: api-html
        configMap:
          name: api-html
```
#### config-map-nginx.yaml

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: api-html
data:
  index.html: |
    <html>
    <body>
      <h1>HELLO</h1>
    </body>
    </html>
```
#### svc_nginx.yaml

```
apiVersion: v1
kind: Service
metadata:
  name: dep-svc
spec:
  selector:
    app: dep_z2
  ports:
    - name: nginx
      protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30100
  type: NodePort
```
#### ingress.yaml

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: web-ingress
  annotations:
spec:
  rules:
  - host: tourk-homework.ru
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: dep-svc
            port:
              number: 80
  tls:
      - hosts:
        - tourk-homework.ru
        secretName: secret-tls
```
------