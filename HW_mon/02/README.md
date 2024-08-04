# Домашнее задание к занятию 14 «Средство визуализации Grafana» - Мирошниченко Никита

## Задание повышенной сложности

**При решении задания 1** не используйте директорию [help](./help) для сборки проекта. Самостоятельно разверните grafana, где в роли источника данных будет выступать prometheus, а сборщиком данных будет node-exporter:

- grafana;
- prometheus-server;
- prometheus node-exporter.

За дополнительными материалами можете обратиться в официальную документацию grafana и prometheus.

В решении к домашнему заданию также приведите все конфигурации, скрипты, манифесты, которые вы 
использовали в процессе решения задания.

**При решении задания 3** вы должны самостоятельно завести удобный для вас канал нотификации, например, Telegram или email, и отправить туда тестовые события.

В решении приведите скриншоты тестовых событий из каналов нотификаций.

## Обязательные задания

### Задание 1

Написал свои Docker-compose.yml и Prometheus.yml для развертывания Prometheus+Grafana+node_exporter, используя документацию на сайтах prometheus, grafana:

Docker-compose: https://github.com/Tourker/Git_HW/blob/main/HW_mon/02/Prom_graf_node/docker-compose.yml

Prometheus: https://github.com/Tourker/Git_HW/blob/main/HW_mon/02/Prom_graf_node/prometheus.yml

Запущенные контейнеры:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_mon/img/02/0.jpg)

Скриншот добавленного source в grafana:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_mon/img/02/1.jpg)


## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
1. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
1. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);
- CPULA 1/5/15;
- количество свободной оперативной памяти;
- количество места на файловой системе.

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

Решение:

1) Утилизация CPU для nodeexporter (в процентах, 100-idle):

100-(rate(node_cpu_seconds_total{instance="node-exporter:9100", mode="idle"}[5m]))

2) CPULA 1/5/1:

node_load1 node_load5 node_load1

3) Количество свободной оперативной памяти:

node_memory_MemFree_bytes

4) Количество места на файловой системе:

node_filesystem_size_bytes{fstype="ext4"} - общий размер файловой системы

node_filesystem_free_bytes{fstype="ext4"} - свободное место на файловой системе

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_mon/img/02/2.jpg)

## Задание 3

1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
1. В качестве решения задания приведите скриншот вашей итоговой Dashboard.

Alert добавил через Discord с помощью Webhook'а в свой канал:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_mon/img/02/3.jpg)

Итоговый Dashboard:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_mon/img/02/4.jpg)

## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
1. В качестве решения задания приведите листинг этого файла.

Листинг файла: https://github.com/Tourker/Git_HW/blob/main/HW_mon/02/json_dashboard.txt

---