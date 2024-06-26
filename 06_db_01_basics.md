# Домашнее задание к занятию "`Типы и структура СУБД`" - `Мирошниченко Никита`


---

### Задание 1

1) Для электронных чеков в json-виде лучше использовать документо-ориентированные БД (например, MongoDB) либо иерархическую.
2) Для складов и автомобильных дорог логистической компании можно использовать графовые.
3) Для гениалогических деревьев - иерархические БД.
4) Для кэша идентификаторов клиентов можно использовать NOSQL БД типа ключ-значение (например, Memcached или Redis).
5) Для интернет-магазина лучше использовать реляционные БД (PostgresSQL, Mysql, MariaDB и т.п.).

---

### Задание 2. 

1) Данные записываются на все узлы с задержкой до часа (асинхронная запись) - по CAP-теореме соответсвует PA, а по теореме PACELC - PA/EC.
2) При сетевых сбоях система может разделиться на 2 раздельных кластера - по CAP-теореме соответсвует CA, а по теореме PACELC - PA/EL.
3) Система может не прислать корректный ответ или сбросить соединение - по CAP-теореме соответсвует PC, а по теореме PACELC - PC/EC.

---

### Задание 3. 

В одной системе сочетаться принципы BASE и ACID не могут, т.к. полностью противоречат друг другу. В ACID должна соблюдаться строгая согласованность и целостность, когда же в BASE не выдвигается таких требований. При выборе BASE или ACID следует исходить от целей и структурированности данных. Например, ACID подходит для корпоративных приложений, в которых требуется строгая согласованность, надежность и предсказуемость данных (например, банковские системы). BASE подходят для анализа больших объемов слабоструктурированных данных (Биржа, Аукционы).

--- 

### Задание 4. 

Вероятнее всего имеется ввиду Redis. В данной системе имеются следующие недостатки:
1) Данные хранятся в оперативной памяти и соответственно от ее размера зависит объем хранимых данных, также имеется риск потери данных.
2) Система репликации требует ручного переключения при выходе из строя основного кластера.
3) Однопоточность работы

---
