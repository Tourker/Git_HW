# Домашнее задание к занятию "`Система мониторинга Zabbix`" - `Мирошниченко Никита`

---


### Задание 1

1. `Cкриншот авторизации в админке`

![Скриншот авторизации](https://github.com/Tourker/Git_HW/blob/main/img/Zabbix_hw2_1.jpg)`

2. `Текст команд для установки Zabbix Server`

#### Установка postgresql:
```
sudo apt update
sudo apt install postgresql
```

#### Установка репозитория Zabbix:
```
wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb
dpkg -i zabbix-release_6.0-4+debian11_all.deb
apt update
```

#### Установка Zabbix-server: 
`apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts`

#### Создание БД и пользователя:
```
su - postgres -c 'psql --command "CREATE USER zabbix WITH PASSWORD '\'123456789\'';"'
su - postgres -c 'psql --command "CREATE DATABASE zabbix OWNER zabbix;"'
```

#### Импорт начальной схемы
`zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix`

#### Задание пароля DBPassword в /etc/zabbix/zabbix_server.conf
`nano /etc/zabbix/zabbix_server.conf`

#### Запуск Zabbix сервера
```
systemctl restart zabbix-server apache2
systemctl enable zabbix-server apache2
```


---

### Задание 2

1. `Скриншот раздела Configuration > Hosts`

![Скриншот раздела Configuration > Hosts](https://github.com/Tourker/Git_HW/blob/main/img/config_hosts.jpg)`

2. `Скриншот лога zabbix agent`

![Скриншот лога zabbix agent](https://github.com/Tourker/Git_HW/blob/main/img/Zabbix_agent_service.jpg)`

3. `Скриншот раздела Monitoring > Latest data`

![Скриншот раздела Monitoring > Latest data](https://github.com/Tourker/Git_HW/blob/main/img/latest_data.jpg)`

4. `Текст команд для установки Zabbix Agent`

#### Установка репозитория Zabbix:

```
wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb
dpkg -i zabbix-release_6.0-4+debian11_all.deb
apt update
```

#### Установка Zabbix-agent:

`apt install zabbix-agent`

#### Запуск и настройка автозагрузки с ОС:

```
systemctl restart zabbix-agent
systemctl enable zabbix-agent
```

---

### Задание 3*

3. `Скриншот раздела Monitoring > Latest data с zabbix агента на Windows`

![Скриншот раздела Monitoring > Latest data](https://github.com/Tourker/Git_HW/blob/main/img/latest_data_windows.jpg)`
