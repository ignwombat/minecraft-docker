FROM ubuntu:22.04 AS tmp
ADD ${JAVA_RUNTIME} /jre

FROM ubuntu:22.04

RUN mkdir jre
COPY --from=tmp /jre/*/* ./jre

COPY ${$MINECRAFT_SERVER_JARFILE} ./server.jar
COPY data/[^world^config]* .

EXPOSE ${MINECRAFT_SERVER_PORT}
CMD ["./jre/bin/java", "-Xms${MINECRAFT_SERVER_MIN_RAM}", "-Xmx${MINECRAFT_SERVER_MAX_RAM}", "-jar", "server.jar", "nogui"]