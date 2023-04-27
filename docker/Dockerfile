FROM ubuntu:22.04 AS tmp
WORKDIR /tmp
ADD ["$JAVA_RUNTIME", "/tmp"]

FROM ubuntu:22.04 AS build
WORKDIR /server

COPY --from=tmp /tmp/*/* /server/jre

COPY ["$MINECRAFT_SERVER_JARFILE", "/server/server.jar"]

COPY ["data/[^world^config]*", "/server"]

EXPOSE ${MINECRAFT_SERVER_PORT}
CMD ["./jre/bin/java", "-Xms$MINECRAFT_SERVER_MIN_RAM", "-Xmx$MINECRAFT_SERVER_MAX_RAM", "-jar", "server.jar", "nogui"]