# Домашнее задание к занятию "`Что такое DevOps. CI/CD`" - `Мирошниченко Никита`

---

### Задание 1

`Cкриншот конфигурации с git`

![Cкриншот страницы шаблона](https://github.com/Tourker/Git_HW/blob/main/img/CICD/Jenkins_Z1_configure1.jpg)

`Скриншот конфигурации с Stages`

![Cкриншот](https://github.com/Tourker/Git_HW/blob/main/img/CICD/Jenkins_Z1_configure2.jpg)

`Скриншот результата выполнения сборки`

![Cкриншот](https://github.com/Tourker/Git_HW/blob/main/img/CICD/Jenkins_Z1.jpg)

### Задание 2

#### Код сборки из задания 1 в декларативном виде
```
pipeline {
 agent any
 stages {
  stage('Git') {
   steps {git url: 'https://github.com/Tourker/sdvps-materials.git', branch: 'main'}
  }
  stage('Test') {
   steps {
    sh '/usr/local/go/bin/go test .'
   }
  }
  stage('Build') {
   steps {
    sh 'docker build . -t ubuntu-bionic:8082/hello-world:v$BUILD_NUMBER'
   }
  }
  stage('Push') {
   steps {
    sh 'docker login ubuntu-bionic:8082 -u admin --password 428324 && docker push ubuntu-bionic:8082/hello-world:v$BUILD_NUMBER && docker logout'   }
  }
 }
}

```
`Скриншот результата выполнения сборки`
![Cкриншот](https://github.com/Tourker/Git_HW/blob/main/img/CICD/Jenkins_Z2_result.jpg)

`Скриншот результата выполнения сборки и выгрузки в Nexus`
![Cкриншот](https://github.com/Tourker/Git_HW/blob/main/img/CICD/Jenkins_Z2_result_with_nexus.jpg)

### Задание 3

#### Код сборки в декларативном виде
```
pipeline {
 agent any
 tools {
    go '1.17.5'}
 stages {
  stage('Git') {
   steps {git url: 'https://github.com/Tourker/sdvps-materials.git', branch: 'main'}
  }
  stage('Test') {
   steps {
    sh '/usr/local/go/bin/go test .'
   }
  }
  stage('Build') {
   steps {
    sh 'go build -o ./app .'
   }
  }
  stage('Push') {
   steps {
    sh 'curl -v -u admin:428324 --upload-file ./app ubuntu-bionic:8081/repository/RAW_hosted_GO/app:v$BUILD_NUMBER'   }
  }
  }
 }

```
`Скриншот результата выполнения сборки и выгрузки в Nexus`
![Cкриншот](https://github.com/Tourker/Git_HW/blob/main/img/CICD/Jenkins_Z3_result_with_nexus.jpg)

`Проверка сборки из репозитория в linux`
![Cкриншот](https://github.com/Tourker/Git_HW/blob/main/img/CICD/JenkinsZ3_check_result_Linux.jpg)
