# Домашнее задание к занятию "`Disaster recovery и Keepalived`" - `Мирошниченко Никита`

---

### Задание 1

![Настройки](https://github.com/Tourker/Git_HW/blob/main/img/backup/zadanie1.jpg)

### Задание 2

####`Bash-скрипт:`

```
#!/bin/bash

HTML_EXIST=/var/www/html/index.nginx-debian.html
WEB_SERVER=127.0.0.1
PORT=80
</dev/tcp/$WEB_SERVER/$PORT
if [ "$?" -ne 0 ]; then
  echo "Порт: $PORT не доступен"
  if [ -e $HTML_EXIST ]; then
     echo "Файл $HTML_EXIST существует"
  else
     echo "Файл $HTML_EXIST не существует"
  fi
  exit 1
else
  echo "Порт: $PORT доступен"
  if [ -e $HTML_EXIST ]; then
     echo "Файл $HTML_EXIST существует"
  else
     echo "Файл $HTML_EXIST не существует"
  fi
  exit 0
fi
```

`Конфигурация Keepalived на обеих ВМ:`

![Конфигурация Keepalived на обеих ВМ](https://github.com/Tourker/Git_HW/blob/main/img/backup/Keepalived_conf_VM1-VM2.jpg)

`Cкриншот перезда на другой сервер`

![Cкриншот перезда на другой сервер](https://github.com/Tourker/Git_HW/blob/main/img/backup/Transport_on_VM2.jpg)


