FROM openjdk:latest

EXPOSE 9001/tcp

COPY dockerfile/run.sh /home/run.sh
COPY .env /home/.env

COPY twitter/build/libs/twitter-1.2.jar /home/app.jar

ENTRYPOINT ["sh", "/home/run.sh"]
