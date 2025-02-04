FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

COPY . .

RUN ./mvnw clean package

FROM eclipse-temurin:17-jre
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
