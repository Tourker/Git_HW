# Домашнее задание к занятию "`Резервное копирование`" - `Мирошниченко Никита`

---

### Задание 1
####Команда rsync
```
sudo rsync -a --progress --exclude=".*" -c . /tmp/backup
```

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/backup/hw3/Zadanie1.jpg)

### Задание 2

####`Bash-скрипт:`

```
#!/bin/bash

LOG=/var/log/syslog
PATH_BACKUP=/tmp/backup/
DIR=/root/

echo "Begin backup" >> $LOG
rsync -a --progress $DIR $PATH_BACKUP
echo "Backup successful" >> $LOG

```

`Crontab`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/backup/hw3/Zadanie2_crontab.jpg)

`Cкриншот /var/log/syslog и список файлов в директории /tmp/backup`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/backup/hw3/Zadanie2_log.jpg)



