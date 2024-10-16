FROM maven:3.8.5-openjdk-8 AS build

WORKDIR /app

COPY pom.xml ./

RUN mvn dependency:go-offline

COPY src src

RUN mvn package -DskipTests

FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

COPY wait-for-it.sh .

RUN chmod +x wait-for-it.sh

RUN apk add --no-cache bash

EXPOSE 8083

ENTRYPOINT ["./wait-for-it.sh", "db:5432", "--", "./wait-for-it.sh", "rabbitmq:5672", "--", "java", "-jar", "app.jar"]
