# ---------- BUILD STAGE ----------
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# ---------- RUNTIME STAGE ----------
FROM amazoncorretto:21-alpine
WORKDIR /app
COPY --from=build /build/target/*.jar app.jar
EXPOSE 8585
ENTRYPOINT ["java", "-jar", "app.jar"]

FROM jenkins/jenkins:lts-jdk21

USER root

RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

USER jenkins
