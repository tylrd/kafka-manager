FROM openjdk:8 AS build
ARG VERSION
COPY . /app
WORKDIR /app
RUN ./sbt clean dist && unzip target/universal/kafka-manager-$VERSION.zip

FROM openjdk:8-alpine
ARG VERSION
COPY --from=build /app/kafka-manager-$VERSION /app
ENTRYPOINT [ "/app/bin/kafka-manager" ]
