## Local Twitter application
This is a conceptual representation of the Twitter (X) application created for learning puproses for students in Algonquin College for course CST8277 "Enterprise Application Programming". The goal of this project is to demonstrate pros and cons of the microservice architecture in action and let student create the same application by themselves in 4 major steps:
1. General design
2. Data model
3. Impelementation
4. Securing applications

### Build & Run

To build the project, follow the steps below.
1. Install prerequisites
  - JDK 17 with `JAVA_HOME` pointing to the right version
  - Gradle 8.7
  - Docker
  - установить minikube по инструкции https://kubernetes.io/ru/docs/tasks/tools/install-minikube/
2. Для работы kubernetes потребуется загрузка на докер хаб. Для этого нужно зарегистрироваться
на https://hub.docker.com и с помощью команды docker login авторизоваться локально.

3. Выполните 
    ```
cp .env.local .env
    ```

4. Установите свои значения указанных переменных в .env
    ```
GRADLE_PATH=
DOCKER_HUB_LOGIN=
    ```

5. Build java apps
    ```
bin/build
    ```

6. Start db
    ```
docker-compose up
    ```

7. Create database schema
    ```
bin/schema
    ```
8. Создайте кластер миникуба 
    ```
bin/kube_setup
    ```
9. Выполните minikube ip

10. Пропишите в .env
    ```
UMS_APP=http://<ip из прошлого шага>:32000
    ```

11. Выполните для развертывания приложения с настроенным .env
    ```
bin/kube_deploy
    ```

### Verify How It Works
As a result you should have 2 separate services running on your local machine using ports `9000` and `9001` accordingly. Import Postman collections from the `requests` folder into your Postman/Hopscotch/Insomnia client to check how it works.

## License 
This repository is licensed under the [BSD 2-Clause License](LICENSE).
