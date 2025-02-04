FROM eclipse-temurin:21-alpine

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw
RUN ./mvnw dependency:resolve

COPY app ./app

CMD ["./mvnw", "spring-boot:run"]