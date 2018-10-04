# Multi-stage build setup (https://docs.docker.com/develop/develop-images/multistage-build/)

# Stage 1 (to create a "build" image, ~140MB)
FROM openjdk:8-jdk-alpine3.7 AS builder
RUN java -version

COPY . /usr/src/myapp/
WORKDIR /usr/src/myapp/
RUN apk --no-cache add maven && mvn --version
RUN mvn package -DskipTests

FROM openjdk:8-jre-alpine3.7
WORKDIR /root/
COPY --from=builder /usr/src/myapp/target/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","./app.jar"]
