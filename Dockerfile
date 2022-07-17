ARG OPENJDK_VERSION=17.0.3
ARG OPENJDK_MAJOR_VERSION=17
ARG GRAALVM_MAJOR_VERSION=22.1.0

## Building stage
FROM ghcr.io/graalvm/native-image:ol8-java${OPENJDK_MAJOR_VERSION}-${GRAALVM_MAJOR_VERSION} AS builder

WORKDIR /src/

# Cache Gradle
COPY gradle /src/gradle
COPY gradlew /src/
# Run "gradle --version" to let gradle-wrapper download Gradle
RUN ./gradlew --version

# Copy source
COPY . /src/

# Show versions
RUN java -version
RUN ./gradlew --version
RUN native-image --version

# Build
RUN ./gradlew build
RUN ./gradlew nativeCompile
