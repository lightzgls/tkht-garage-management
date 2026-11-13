FROM maven:3.9.11-eclipse-temurin-17 AS build
WORKDIR /build
COPY pom.xml .
COPY src ./src
COPY design ./design
RUN mvn -B -ntp package

FROM tomcat:9.0.123-jdk17-temurin
COPY --from=build /build/target/garage-management.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
