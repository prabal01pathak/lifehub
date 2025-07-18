FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /workspace
COPY . .
WORKDIR /workspace/apps/api-java
RUN echo $pwd
RUN ./gradlew :auth-service:dependencies --no-daemon
RUN ./gradlew :auth-service:bootJar --no-daemon

FROM eclipse-temurin:17-jre-alpine AS runtime
WORKDIR /app

COPY --from=builder /workspace/apps/api-java/auth-service/build/libs/auth-service-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
