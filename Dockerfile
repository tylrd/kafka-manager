FROM openjdk:8-alpine

RUN apk --update add bash

ARG VERSION
COPY kafka-manager-$VERSION /app
ENTRYPOINT [ "/app/bin/kafka-manager" ]
