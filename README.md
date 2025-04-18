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

2. Build java apps
    ```shell
bin/build
    ```

3. Start apps
    ```shell
docker-compose up
    ```

4. Create database schema
    ```shell
bin/schema
    ```

6. Start the application and check how it works

### Verify How It Works
As a result you should have 2 separate services running on your local machine using ports `9000` and `9001` accordingly. Import Postman collections from the `requests` folder into your Postman/Hopscotch/Insomnia client to check how it works.

## License 
This repository is licensed under the [BSD 2-Clause License](LICENSE).
