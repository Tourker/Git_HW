# Домашнее задание к занятию 2 «Работа с Playbook» - Мирошниченко Никита

- [Описание](#Описание)
- [Установка clickhouse](#Установка clickhouse)
- [Установка vector](#Установка vector)
- [Скриншоты к домашнему заданию](#Скриншоты к домашнему заданию)

## Описание
Данный playbook устанавливает и конфигурирует clickhouse и vector
## Установка clickhouse

1. Скачиваются необходимые дистрибутивы clickhouse
2. Устанавливается пакеты clickhouse
3. Запускается служба (либо же с помощью handlers перезапускается при изменениях)
4. Создается база данных log

## Установка vector
1. Скачивается дистрибутив vector
2. Устанавливается через пакетный менеджер yum
3. Подгружается файл конфигурации vector.yml
4. Подгружается файл конфигурации для запуска службы vector.service
5. Производится запуск (либо перезапуск) службы vector

## Скриншоты к домашнему заданию

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/02/check.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/02/diff_2.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/02/lint.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/02/docker ps.jpg)