FROM openjdk:latest

EXPOSE 9000/tcp

COPY dockerfile/run.sh /home/run.sh
COPY .env /home/.env

COPY ums/build/libs/ums-1.2.jar /home/app.jar

ENTRYPOINT ["sh", "/home/run.sh"]
