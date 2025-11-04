# Stage 1: Build the WAR
FROM maven:3.9.8-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the app
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app/target/petclinic.war .
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "petclinic.war"]

