# Домашнее задание к занятию "`Практическое применение Docker`" - `Мирошниченко Никита`

---
### Задача 0

`Скриншот установленного docker compose`
![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z0.jpg)

---

### Задача 1

`Dockerfile.python: `

```
FROM python:3.9-slim

WORKDIR /app

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY ./main.py .

CMD ["python", "main.py"]
```

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z1.jpg)

---

### Задача 2(*)

`Yandex cloud container registry с именем "test": `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z2_1_registry_yc.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z2_2_registry_yc.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z2_registry_tag.jpg)

`Ссылка на отчет сканирования уязвимостей: `

---

### Задача 3

`Ссылка на compose.yaml: ` https://github.com/Tourker/shvirtd-example-python/blob/main/compose.yaml

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z3_sql.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z3_2_curl.jpg)

---

### Задача 4

`Установленный docker:`

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/docker_install.jpg)

`Ссылка на bash-скрипт: ` https://github.com/Tourker/shvirtd-example-python/blob/main/bash.sh


`Запущенный скрипт с запуском контейнера с приложением: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/run_script.jpg)

`SQL-запрос: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/sql.jpg)

`Проверка работы на ВМ в облаке: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/Check_working.jpg)
---
### Задача 6

`Image ls: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z6_1.jpg)

`DIVE: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z6_2_dive.jpg)

`Docker save: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z6_3_docker_save.jpg)

---
### Задача 6.1

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z61_1_docker_cp.jpg)

`Команда Docker cp: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/img/HW05_04/z61_docker_cp.jpg)

---