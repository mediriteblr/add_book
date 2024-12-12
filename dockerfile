FROM maven:3.8.4-openjdk-11-slim AS build-stage

WORKDIR /app

COPY ./pom.xml  ./pom.xml
COPY ./src      ./src
COPY ./settings.xml  ./settings.xml

RUN mvn package
RUN mvn -U deploy -s settings.xml

FROM tomcat:8.5.78-jdk11-openjdk-slim

COPY --from=build-stage /app/target/*.war /usr/local/tomcat/webapps/

expose 8080

CMD ["catalina.sh", "run"]

