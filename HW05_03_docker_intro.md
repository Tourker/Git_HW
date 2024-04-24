# Домашнее задание к занятию "`Оркестрация группой Docker контейнеров на примере Docker Compose`" - `Мирошниченко Никита`

---

### Задание 1

`Dockerfile`
```
FROM nginx:1.21.1

COPY ./index.html /usr/share/nginx/html/index.html

EXPOSE 80/tcp

```
`Ссылка на dockerhub:` https://hub.docker.com/repository/docker/tourk/custom-nginx/general

`Скриншот запущенного контейнера custom-nginx:
`
![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z1_html_nginx.jpg)

---

### Задание 2

`Запуск контейнера на порту 8080:`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z2_run_container.jpg)

`Комманды:`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z2_commands.jpg)

---

### Задание 3

`Подключение к стандартному потоку ввода/вывода/ошибок контейнера "custom-nginx-t2:`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z3_container_attach.jpg)

При нажатии сочетания клавиш CTRL+C происходит отправка сигнала на остановку процессов и перехват сигнала для выхода из контейнера

`Установка редактора nano:`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z3_install_nano.jpg)

`Редактирование файла "/etc/nginx/conf.d/default.conf" и замена порта в строке listen на 81:`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z3_conf_nginx_listen81.jpg)

`Curl: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z3_curl.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z3_port_curl.jpg)

Проблема возникла, что невозможно подключиться к контейнеру по порту 80, т.к. он был изменен внутри контейнера на 81.


`Изменение порта в файлах конфигурации config.v2.json и hostconfig.json и перезапуск контейнера:`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z3_conf_port_in_container.jpg)

`Удаление контейнера: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z3_delete_container.jpg)

---

### Задание 4

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z4_1.jpg)

---

### Задание 5

1) Запустился Compose.yaml, т.к. он по умолчанию предпочтительнее, чем docker-compose.yaml.
2) Добавил секцию include в файле Compose.yaml для того, чтобы загрузился docker-compose.yaml

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_compose.jpg)

`Добавлен include: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_docker_compose.jpg)

`Push в локальный registry: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_push_localregistry.jpg)

`Pull из локального registry: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_delete_and_pull_localregistry.jpg)

`Portainer задание пароля: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_portainer_1.jpg)

`Страничка: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_portainer_2.jpg)

`Контейнер nginx: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_portainer_3_nginx.jpg)

`Конфиг: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_portainer_4_conf_container.jpg)

Предупреждение о том, что есть зависимый контейнер task5-portainer-1. И предлагает запустить, используя команду с флагом --remove-orphans.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_run_compose_d.jpg)

`Удаление проекта docker compose: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_03/z5_remove.jpg)

---