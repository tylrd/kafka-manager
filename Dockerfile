ARG VERSION

FROM openjdk:8 AS build
COPY . /app
WORKDIR /app
RUN ./sbt clean dist && unzip target/universal/kafka-manager-$VERSION.zip

FROM openjdk:8-alpine
COPY --from=build /app/kafka-manager-$VERSION /app
ENTRYPOINT [ "/app/bin/kafka-manager" ]