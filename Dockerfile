FROM openjdk:8-alpine
ARG VERSION
COPY kafka-manager-$VERSION /app
ENTRYPOINT [ "/app/bin/kafka-manager" ]
