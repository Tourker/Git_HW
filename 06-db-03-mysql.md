# Домашнее задание к занятию "`MySQL`" - `Мирошниченко Никита`

### Задание 1

####Docker_compose.yaml

```
version: '3.9'
services:
  mysql:
    image: mysql:8
    container_name: mysqldb
    environment:
      - MYSQL_USER=user
      - MYSQL_PASSWORD=user
      - MYSQL_ROOT_PASSWORD=password
    ports:
      - 3306:3306
    volumes:
      - mysql_data:/var/lib/mysql
volumes:
  mysql_data:

networks:
  mysql:

```
#### Команда STATUS

`STATUS;` (или команда \s)

Установлена версия MySQL 8.3.0 

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z1_status.jpg)

#### Просмотр таблиц

`SHOW TABLES;`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z1_show_tables.jpg)

#### Запрос количества записей из таблицы orders

`SELECT COUNT(*) FROM orders WHERE price > 300;`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z1_count_price.jpg)

---

###Задание 2:

#### Создание пользователя с аттрибутами

`CREATE USER 'test'@'localhost' IDENTIFIED WITH MYSQL_NATIVE_PASSWORD BY 'test-pass' WITH  MAX_QUERIES_PER_HOUR 100  PASSWORD EXPIRE INTERVAL 180 DAY FAILED_LOGIN_ATTEMPTS 3 ATTRIBUTE '{"last_name": "Pretty", "first_name": "James"}';`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z2_create_user.jpg)

#### Права SELECT на базу данных test_db

`GRANT SELECT ON test_db.* TO 'test'@'localhost';`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z2_grant_select.jpg)

#### Запрос получения данных по пользователю test

`SELECT * FROM INFORMATION_SCHEMA.USER_ATTRIBUTES WHERE user='test';`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z2_info_user.jpg)

---

###Задание 3:

#### Установка профилирования и просмотр профилей

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z3_profiles.jpg)

#### Запрос на получение используемого engine

SELECT table_name, table_schema, engine FROM information_schema.tables WHERE table_schema = DATABASE();

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z3_table_status_engine.jpg)

#### Изменение engine

ALTER TABLE orders ENGINE = MyISAM;
ALTER TABLE orders ENGINE = InnoDB;
SHOW PROFILES;

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z3_engines.jpg)

###Задание 4:

#### Файл конфигурации my.cnf

```
[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M
#
# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
# log_bin
#
# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M

# Remove leading # to revert to previous value for default_authentication_plugin,
# this will increase compatibility with older clients. For background, see:
# https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_default_authentication_plugin
# default-authentication-plugin=mysql_native_password
skip-host-cache
skip-name-resolve
datadir=/var/lib/mysql
socket=/var/run/mysqld/mysqld.sock
secure-file-priv=/var/lib/mysql-files
user=mysql


pid-file=/var/run/mysqld/mysqld.pid

#Скорость важнее сохранности данных:
innodb_flush_log_at_trx_commit=0

#Компрессия таблиц для экономии места на диске в формате Barracuda:
innodb_file_format=Barracuda

#Размер буффера
innodb_log_buffer_size=1M

#Размер кэша
key_buffer_size=614М

#Размел лога
max_binlog_size=100M

[client]
socket=/var/run/mysqld/mysqld.sock

!includedir /etc/mysql/conf.d/

```
![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_03/z4_mycnf.jpg)
