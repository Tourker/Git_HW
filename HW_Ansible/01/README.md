# Домашнее задание к занятию 1 «Введение в Ansible» - `Мирошниченко Никита`

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

`Запуск playbook: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z1_1.jpg)

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

`Замена значения и запуск playbook: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z1_2.jpg)

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.
4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

`Запуск playbook: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z1_3_4.jpg)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.
6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

`Запуск playbook после корректировки значение some_fact: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z1_6.jpg)

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

`Шифрование фактов: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z1_7.jpg)

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

`Запуск playbook: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z1_8.jpg)

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

`Запуск playbook: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z1_9.jpg)

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

`Добавление новой группы хостов local: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z1_10.jpg)

11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

`Запуск playbook: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z1_11.jpg)


## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.

`Расшифровка: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z2_decrypt.jpg)

2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.

`Шифрование: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z2_encrypt_password.jpg)

3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.

`Запуск playbook: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z2_result.jpg)

4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).

`Запуск playbook: `

![Скриншот](https://github.com/Tourker/Git_HW/blob/main/HW_Ansible/img/01/z2_playbook.jpg)

