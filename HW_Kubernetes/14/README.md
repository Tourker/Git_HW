# Домашнее задание к занятию «Обновление приложений» - Мирошниченко Никита

### Цель задания

Выбрать и настроить стратегию обновления приложения.

### Чеклист готовности к домашнему заданию

1. Кластер K8s.

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Документация Updating a Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#updating-a-deployment).
2. [Статья про стратегии обновлений](https://habr.com/ru/companies/flant/articles/471620/).

-----

### Задание 1. Выбрать стратегию обновления приложения и описать ваш выбор

1. Имеется приложение, состоящее из нескольких реплик, которое требуется обновить.
2. Ресурсы, выделенные для приложения, ограничены, и нет возможности их увеличить.
3. Запас по ресурсам в менее загруженный момент времени составляет 20%.
4. Обновление мажорное, новые версии приложения не умеют работать со старыми.
5. Вам нужно объяснить свой выбор стратегии обновления приложения.

#### Решение

Выбрал стратегию Rolling Update по причине ограничений в ресурсах, возможности постепенного обновления (один под падает - новый поднимается до тех пор пока не заменятся все поды на новую версию), а также из-за возможности в любой момент откатится на предыдущую версию, обеспечивая таким образом минимальный простой.

### Задание 2. Обновить приложение

1. Создать deployment приложения с контейнерами nginx и multitool. Версию nginx взять 1.19. Количество реплик — 5.
2. Обновить версию nginx в приложении до версии 1.20, сократив время обновления до минимума. Приложение должно быть доступно.
3. Попытаться обновить nginx до версии 1.28, приложение должно оставаться доступным.
4. Откатиться после неудачного обновления.

#### Решение:

1. Поднял deployment с nginx:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/14/z2_1.jpg)

2. Изменил версию nginx на 1.20:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/14/z2_2.jpg)

3. Применил изменения в deployment и проверил, что пошел процесс замены подов с новой версией nginx:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/14/z2_3.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/14/z2_4.jpg)

4. Замена на несуществующую версию nginx 1.28:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/14/z2_5.jpg)

5. Проверка что старые поды остались запущены, а новые с ошибкой:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/14/z2_6.jpg)

6. Откат на предыдущую версию:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/14/z2_7.jpg)

---
##### Исходный код:

[deployment.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/14/deployment.yaml)
[svc.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/14/svc.yaml.yaml)


---
## Дополнительные задания — со звёздочкой*

Задания дополнительные, необязательные к выполнению, они не повлияют на получение зачёта по домашнему заданию. **Но мы настоятельно рекомендуем вам выполнять все задания со звёздочкой.** Это поможет лучше разобраться в материале.   

### Задание 3*. Создать Canary deployment

1. Создать два deployment'а приложения nginx.
2. При помощи разных ConfigMap сделать две версии приложения — веб-страницы.
3. С помощью ingress создать канареечный деплоймент, чтобы можно было часть трафика перебросить на разные версии приложения.

#### Решение

1. Создал 2 деплоймента с последними версиями nginx, указал веб-страницы в configmap для каждого деплоймента. Поднял ingress для 1 версии приложения и ingress-new для передачи трафика в приложение новой версии. 

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/14/z3_1.jpg)

2. Проверка, что трафик перебрасывается при указании запроса curl в header и pattern - "Irkutsk: bratsk":

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/14/z3_2.jpg)


##### Исходный код:

[nginx1.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/14/canary/nginx1.yaml)
[nginx2.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/14/canary/nginx2.yaml)
[ingress.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/14/canary/ingress.yaml)
[ingress-canary.yaml](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/14/canary/ingress-canary.yaml)

### Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.