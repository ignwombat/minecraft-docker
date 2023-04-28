# Temporarily extract Java
# The archive comes with a subfolder with the version name

FROM ubuntu:22.04 AS tmp
ADD ${JAVA_RUNTIME} /jre

FROM ubuntu:22.04

RUN mkdir jre
COPY --from=tmp /jre/*/* ./jre

COPY ${MINECRAFT_SERVER_JARFILE} ./server.jar
COPY data/[^world^config]* .

EXPOSE ${MINECRAFT_SERVER_PORT}

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT MIN_RAM=${MINECRAFT_SERVER_MIN_RAM} MAX_RAM=${MINECRAFT_SERVER_MAX_RAM} ./entrypoint.sh