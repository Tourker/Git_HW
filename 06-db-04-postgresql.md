# Домашнее задание к занятию "`PostgreSQL`" - `Мирошниченко Никита`

---

### Задание 1:

```
version: '3.9'
services:
    dbpostgres:
        image: postgres:13
        container_name: postgres
        environment:
            - PGDATA=/postgresql/data/
            - POSTGRES_USER=postgres
            - POSTGRES_PASSWORD=postgres
        volumes:
            - postgres_data:/postgresql/data/
networks:
    postgres:

volumes:
    postgres_data:

```
#### Список БД

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z1_list_db.jpg)

#### Подключение к БД

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z1_conninfo.jpg)

#### Список таблиц

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z1_list_tables.jpg)

#### Описание содержимого таблиц

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z1_list_relations.jpg)

#### Выход

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z1_exit.jpg)

---

### Задание 2

#### Создание базы данных

`CREATE DATABASE test_database;`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z2_create_db.jpg)

#### Восстановление бэкапа

`sudo docker exec -i postgres psql -U postgres < share/test_dump.sql`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z2_restore_backup_db_in_container.jpg)

#### Сбор статистики командой ANALYZE

`ANALYZE VERBOSE public.orders;`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z2_connect_and_analyze.jpg)

#### Столбец таблицы orders с наибольшим средним значением размера элементов в байтах

`SELECT avg_width FROM pg_stats WHERE tablename='orders';`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z2_avg.jpg)

---

### Задание 3

#### Создание 2-х таблиц и шардирование по условиям.

`CREATE TABLE orders_1 (CHECK (price > 499)) INHERITS (orders);`
`INSERT INTO orders_1 SELECT * FROM orders WHERE price > 499;`
`CREATE TABLE orders_2 (CHECK (price <= 499)) INHERITS (orders);`
`INSERT INTO orders_2 SELECT * FROM orders WHERE price <= 499;`
`DELETE FROM ONLY orders;`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z3_sharding.jpg)

Можно, если воспользоваться правилами вставки:

`CREATE RULE orders_insert_to_more AS ON INSERT TO orders WHERE ( price > 499 ) DO INSTEAD INSERT INTO orders_1 VALUES (NEW.*);`
`CREATE RULE orders_insert_to_less AS ON INSERT TO orders WHERE ( price <= 499 ) DO INSTEAD INSERT INTO orders_2 VALUES (NEW.*);`

---

### Задание 4

#### Создание бэкапа базы данных

`pg_dump -U postgres test_database > /backup/backup_test_database.sql;`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_04/z4_backup.jpg)

Добавил бы свойство UNIQUE:

`CREATE TABLE public.orders (id integer NOT NULL, title character varying(50) NOT NULL UNIQUE, price integer DEFAULT 0);`

