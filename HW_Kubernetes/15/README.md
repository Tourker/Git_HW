# Домашнее задание к занятию Troubleshooting - Мирошниченко Никита

### Цель задания

Устранить неисправности при деплое приложения.

### Чеклист готовности к домашнему заданию

1. Кластер K8s.

### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить

1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```
2. Выявить проблему и описать.
3. Исправить проблему, описать, что сделано.
4. Продемонстрировать, что проблема решена.

#### Решение:

1. Ошибка при попытке деплоя, что отсутвуют namespaces - web и data:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/15/z1_1.jpg)

2. Создаем namespaces - web и data. Как видно все развернулось:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/15/z1_2.jpg)

3. Проверяем логи приложения - видно, что приложение пытается подключится к auth-db, но не может из-за отсутствия dns хоста:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/15/z1_3.jpg)

##### Вариант №1 Прописать изменения в /etc/hosts в подах 

4. Для рещения ошибки необходимо прописать auth-db и IP-адресс service в файле /etc/hosts в самих подах приложения. Заходим в каждый pod из namespace - web и добавляем необходимые записи и проверям через curl:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/15/z1_4.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/15/z1_5.jpg)

5. Проверяем ответ приложения на самой ноде через curl:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/15/z1_6.jpg)

##### Вариант №2 Изменить в task.yaml запрос на доменное имя service (auth-db.data.svc.cluster.local), чтобы исключить возможность потери изменений при перезапуске пода

1. Редактируем task.yaml

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/15/z1_7.jpg)

2. Запускаем новый task.yaml и проверяем логи подов:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Kubernetes/img/15/z1_8.jpg)


### Правила приёма работы

1. Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.