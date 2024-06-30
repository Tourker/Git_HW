# Домашнее задание к занятию 3 «Использование Ansible» - Мирошниченко Никита

- [Описание](#Описание)
- [Установка clickhouse](#Установка-clickhouse)
- [Установка vector](#Установка-vector)
- [Установка lighthouse](#Установка-lighthouse)
- [Результат выполнения playbook](#Результат-выполнения-playbook)

## Описание
Данный playbook устанавливает и конфигурирует clickhouse, vector и lighthouse

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

## Установка lighthouse

1. Установка git через yun
2. Установка пакетного репозитория Epel-release через yum
3. Установка nginx через yum
4. Подгрузка файла конфигурации nginx из template
5. Клонирует git репозиторий https://github.com/VKCOM/lighthouse.git
6. Подгрузка файла конфигурации lighthouse из template
7. Перезапуск службы nginx 

## Результат выполнения playbook

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/03/result.jpg)