# Домашнее задание к занятию 12 «GitLab» - Мирошниченко Никита

## Подготовка к выполнению


1. Или подготовьте к работе Managed GitLab от yandex cloud [по инструкции](https://cloud.yandex.ru/docs/managed-gitlab/operations/instance/instance-create) .
Или создайте виртуальную машину из публичного образа [по инструкции](https://cloud.yandex.ru/marketplace/products/yc/gitlab ) .
2. Создайте виртуальную машину и установите на нее gitlab runner, подключите к вашему серверу gitlab  [по инструкции](https://docs.gitlab.com/runner/install/linux-repository.html) .

3. (* Необязательное задание повышенной сложности. )  Если вы уже знакомы с k8s попробуйте выполнить задание, запустив gitlab server и gitlab runner в k8s  [по инструкции](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/gitlab-containers). 

4. Создайте свой новый проект.
5. Создайте новый репозиторий в GitLab, наполните его [файлами](./repository).
6. Проект должен быть публичным, остальные настройки по желанию.

## Основная часть

### DevOps

В репозитории содержится код проекта на Python. Проект — RESTful API сервис. Ваша задача — автоматизировать сборку образа с выполнением python-скрипта:

1. Образ собирается на основе [centos:7](https://hub.docker.com/_/centos?tab=tags&page=1&ordering=last_updated).
2. Python версии не ниже 3.7.
3. Установлены зависимости: `flask` `flask-jsonpify` `flask-restful`.
4. Создана директория `/python_api`.
5. Скрипт из репозитория размещён в /python_api.
6. Точка вызова: запуск скрипта.
7. При комите в любую ветку должен собираться docker image с форматом имени hello:gitlab-$CI_COMMIT_SHORT_SHA . Образ должен быть выложен в Gitlab registry или yandex registry.   

### Product Owner

Вашему проекту нужна бизнесовая доработка: нужно поменять JSON ответа на вызов метода GET `/rest/api/get_info`, необходимо создать Issue в котором указать:

1. Какой метод необходимо исправить.
2. Текст с `{ "message": "Already started" }` на `{ "message": "Running"}`.
3. Issue поставить label: feature.

### Developer

Пришёл новый Issue на доработку, вам нужно:

1. Создать отдельную ветку, связанную с этим Issue.
2. Внести изменения по тексту из задания.
3. Подготовить Merge Request, влить необходимые изменения в `master`, проверить, что сборка прошла успешно.


### Tester

Разработчики выполнили новый Issue, необходимо проверить валидность изменений:

1. Поднять докер-контейнер с образом `python-api:latest` и проверить возврат метода на корректность.
2. Закрыть Issue с комментарием об успешности прохождения, указав желаемый результат и фактически достигнутый.

## Итог

В качестве ответа пришлите подробные скриншоты по каждому пункту задания:

- файл gitlab-ci.yml;
- Dockerfile; 
- лог успешного выполнения пайплайна;
- решённый Issue.

### Важно 
После выполнения задания выключите и удалите все задействованные ресурсы в Yandex Cloud.

## Решение

В связи с прекращением поддержки CENTOS 7, в домашнем задании использовал образ Debian:12 для сборки.

#### Установка gitlab-runner

1. Создал ВМ:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z0_1.jpg)

2. Установил gitlab-runner на ВМ:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z0_2.jpg)

3. После установки и настройки gitlab-instance подвязал к проекту gitlab-runner

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z0_3.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z0_4.jpg)

#### Установка gitlab-instance в YC:

1. Поднял инстанс в YC:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z1_0.jpg)

2. Создал публичный проект и добавил файлы из домашнего задания:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z1_1.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z1_2.jpg)

4. Создал issues и merge-request:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z1_3.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z1_4.jpg)

5. Dockerfile с образом Debian 12:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z1_5.jpg)

6. Описал этапы Pipeline:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z1_6.jpg)

7. Выполненный успешно pipeline:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z1_7_1.jpg)

8. Созданный образ в Registry:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z1_7_0.jpg)

#### Задание с редактированием JSON и новый issues:

1. Новое задание с merge-request для внесения изменений в JSON:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z2_1.jpg)

2. Редактирование python-pi.py:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z2_2.jpg)

3. Коммит изменений в Dockerfile и успешный pipline после изменений:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z2_3.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z2_4.jpg)

#### Проверка образа и запуск:

1. Авторизация и pull образа с registry:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z3_1.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z3_2.jpg)

2. Запущенный контейнер и проверка запроса через curl:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z3_3.jpg)

3. Закрытие issues:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/05/z3_4.jpg)

### Исходный код 

- [Dockerfile](https://github.com/Tourker/Git_HW/blob/main/HW_CI/05/Dockerfile)
- [python-api.py](https://github.com/Tourker/Git_HW/blob/main/HW_CI/05/python-api.py)
- [.gitlab-ci.yml](https://github.com/Tourker/Git_HW/blob/main/HW_CI/05/.gitlab-ci.yml)