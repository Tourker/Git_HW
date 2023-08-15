# Домашнее задание к занятию "`Система мониторинга Zabbix. Часть 2`" - `Мирошниченко Никита`

---

### Задание 1

`Cкриншот страницы шаблона`

![Cкриншот страницы шаблона](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/template.jpg)`

`Скриншот Item CPU_load`

![Cкриншот](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/CPU_load.jpg)`

`Скриншот Item RAM_load`

![Cкриншот](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/RAM_load.jpg)`

### Задание 2-3

![Привязка шаблонов](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/Zadanie2-3.jpg)`

### Задание 4

![Скриншот дашборда](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/Dashboard.jpg)`

### Задание 5*

![Скриншот карты](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/Map.jpg)`

### Задание 6*

`Код скрипта на Bash`

#### Код
```
#!/bin/bash

if [[ $1 == 1 ]]; then
    echo "Miroshnichenko Nikita Andreevich"
elif [[ $1 == 2 ]]; then
    date
else
    echo "Unknown UserParameter"
fi;

```
![Скриншот работы](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/Bash_LatesData.jpg)`

### Задание 7*

`Код скрипта на Python`

#### Код
```
import sys
import os
import re
from datetime import datetime

if (sys.argv[1] == '1'):
    print("Miroshnichenko Nikita Andreevich") # Вывод ФИО
elif (sys.argv[1] == '2'):
    print(datetime.now()) # Текущая дата
elif (sys.argv[1] == '-ping'): # Если -ping
    result=os.popen("ping -c 1 " + sys.argv[2]).read() # Делаем пинг по заданному адресу
    result=re.findall(r"time=(.*) ms", result) # Выдёргиваем из результата время
    print(result[0]) # Выводим результат в консоль
elif (sys.argv[1] == '-simple_print'): # Если simple_print
    print(sys.argv[2]) # Выводим в консоль содержимое sys.arvg[2]
else: # Во всех остальных случаях
    print(f"unknown input: {sys.argv[1]}") # Выводим непонятый запрос в консоль
```
![Скриншот работы](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/Py_LatesData.jpg)`

### Задание 8*

![Скриншот Rules](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/Discovery_rules.jpg)`

![Скриншот Discover](https://github.com/Tourker/Git_HW/blob/main/img/monitoring/Discovery_config_host.jpg)`


