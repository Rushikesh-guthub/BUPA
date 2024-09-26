# Stage 1: Build the application
FROM docker.io/library/maven:3.8.7-openjdk-18-slim AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml ./
COPY . .

# Package the application
RUN mvn -f backend/pom.xml clean package -DskipTests

# Stage 2: Create the runtime image
FROM docker.io/library/openjdk:18-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/backend/target/backend-1.0-SNAPSHOT.jar app.jar

# Expose the port the app runs on
EXPOSE 8088

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
