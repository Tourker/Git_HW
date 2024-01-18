# Домашнее задание к занятию "`SQL. Часть 1`" - `Мирошниченко Никита`

---
### Задание 1

####Docker_compose.yaml
```
version: '3.1'
services:
    db_postgressql:
        image: postgres:12
        container_name: postgres
        environment:
            PGDATA: /var/lib/postgresql/data/
            POSTGRES_USER: ${POSTGRES_USER:-postgres}
            POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-postgres}
        volumes:
            - postgres_data:/var/lib/postgresql/data
            - backup_postgres:/backup
networks:
    postgres:

volumes:
    postgres_data:
    backup_postgres:
```
---

###Задание 2

`CREATE USER "test-admin-user";`
`CREATE DATABASE test_db;`

```
CREATE TABLE orders (
id serial PRIMARY KEY,
order_name varchar(25),
price integer);
```
```
CREATE TABLE clients (
id serial PRIMARY KEY,
last_name varchar(50),
country varchar(50),
number_order integer REFERENCES orders);
```

`CREATE INDEX index_country ON clients(country);`

`GRANT ALL ON ALL TABLES IN SCHEMA "public" TO "test-admin-user";`

`CREATE USER "test-simple-user";`

`GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "public"TO "test-simple-user";`

`SELECT table_name, grantee, privilege_type FROM information_schema.role_table_grants WHERE table_name='orders';`
`SELECT table_name, grantee, privilege_type FROM information_schema.role_table_grants WHERE table_name='clients';`

####Итоговый список БД

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_02/z2_List_DB.jpg)

####Описание таблиц

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_02/z2_Desc_tables.jpg)

####Список пользователей с правами над таблицами БД test_db

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_02/z2_grants_user_tables.jpg)


---

###Задание 3

`INSERT INTO orders VALUES (1, 'Шоколад', 10), (2, 'Принтер', 3000), (3, 'Книга', 500), (4, 'Монитор', 7000), (5, 'Гитара', 4000);`
`INSERT INTO clients VALUES (1, 'Иванов Иван Иванович', 'USA'), (2, 'Петров Петр Петрович', 'Canada'), (3, 'Иоганн Себастьян Бах', 'Japan'),(4, 'Ронни Джеймс Дио', 'Russia'),(5, 'Ritchie Blackmore', 'Russia');`

`SELECT * FROM orders;`
`SELECT * FROM clients;`

####Результат запроса данных с таблиц

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_02/z3_select_from_tables.jpg)


`SELECT COUNT(*) FROM orders;`
`SELECT COUNT(*) FROM clients;`

####Результат запросов на количество записей

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_02/z3_select_counts_tables.jpg)


---

###Задание 4

`UPDATE clients SET number_order=3 WHERE id=1;`
`UPDATE clients SET number_order=4 WHERE id=2;`
`UPDATE clients SET number_order=5 WHERE id=3;`

`SELECT * FROM clients WHERE number_order IS NOT NULL;`

####Результат запроса на список пользователей, совершивших заказ

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_02/z4_select_clients_with_orders.jpg)


---

###Задание 5

`EXPLAIN SELECT * FROM clients WHERE number_order IS NOT NULL;`

####Результат запроса EXPLAIN

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW_06_db_02/z5_explain.jpg)


Команда EXPLAIN отображает информацию о процессе выполнения запроса. Данная информация позволяет анализировать какой запрос медленнее выполняется, чтобы в последствии произвести оптимизацию и ускорить его выполнение, а следовательно и работу всей БД.


---

###Задание 6


####Создание бэкапа в контейнере

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/z6_pg_dump_from_container.jpg)

`sudo docker exec -it postgres pg_dumpall -U postgres > backup_test_db`

####Восстановление бэкапа в новый контейнер

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/z6_recovery_db_from_backup.jpg)

`sudo docker exec -i postgres_new psql -U postgres < backup_test_db`

####Восстановленная БД в новом контейнере

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/z6_backup_in_new_container.jpg)



