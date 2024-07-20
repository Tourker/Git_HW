# Домашнее задание к занятию 10 «Jenkins» - Мирошниченко Никита

## Подготовка к выполнению

1. Создать два VM: для jenkins-master и jenkins-agent.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/VM.jpg)

2. Установить Jenkins при помощи playbook.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/1.jpg)

3. Запустить и проверить работоспособность.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/2.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/3.jpg)

4. Сделать первоначальную настройку.

`Настройка агента: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/4.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/5.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/6.jpg)

Версия molecule:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/7.jpg)



## Основная часть

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/8.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/9.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/10.jpg)

2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/11.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/12.jpg)

3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.

Перенес файл репозиторий с ролью: https://github.com/Tourker/docker-molecule/blob/master/Jenkinsfile

4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/13.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/14.jpg)

5. Создал Scripted Pipeline и внес необходимые изменения:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/15.jpg)

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/16.jpg)

ScriptedJenkinsfile: https://github.com/Tourker/docker-molecule/blob/master/ScriptedJenkinsfile

6. Общий результат по созданным job'ам:

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_CI/img/03/17.jpg)

Ссылка на репозиторий с тестовой ролью: https://github.com/Tourker/docker-molecule
---