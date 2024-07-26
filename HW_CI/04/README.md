# Домашнее задание к занятию 11 «Teamcity» - Мирошниченко Никита

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
2. Дождитесь запуска teamcity, выполните первоначальную настройку.
3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
4. Авторизуйте агент.
5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).

`Установка nexus с помощью ansible: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/1.jpg)

`Созданные ВМ в YC: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/2.jpg)

`Авторизованный клиент: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/4.jpg)

## Основная часть

1. Создайте новый проект в teamcity на основе fork.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/3.jpg)

2. Сделайте autodetect конфигурации.
3. Сохраните необходимые шаги, запустите первую сборку master.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/5.jpg)

4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/5_1.jpg)

5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/6.jpg)

6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.

https://github.com/Tourker/example-teamcity/blob/master/pom.xml

7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/7.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/8.jpg)

8. Мигрируйте `build configuration` в репозиторий.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/10.jpg)

9. Создайте отдельную ветку `feature/add_reply` в репозитории.
10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/11.jpg)

11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/12.jpg)

12. Сделайте push всех изменений в новую ветку репозитория.
13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.
14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/14.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/15.jpg)

15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.

`Прошел билд по ветке feature/add_reply: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/13.jpg)

16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/17.jpg)

17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/18.jpg)

18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/04/19.jpg)

19. В ответе пришлите ссылку на репозиторий.

Ссылка на репозиторий: https://github.com/Tourker/example-teamcity/tree/master