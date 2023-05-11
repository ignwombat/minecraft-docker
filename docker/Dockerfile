# Temporarily extract Java
# The archive comes with a subfolder with the version name

FROM ubuntu:22.04 AS tmp

RUN DEBIAN_FRONTEND=noninteractive apt install -y tar
RUN tar -xf ${JAVA_RUNTIME} -C /jre

FROM ubuntu:22.04

RUN mkdir jre
COPY --from=tmp /jre/*/* ./jre

COPY ${MINECRAFT_SERVER_JARFILE} ./server.jar
COPY data/[^world^config]* .

EXPOSE 25565

COPY entrypoint.sh .
ENTRYPOINT MIN_RAM=${MINECRAFT_SERVER_MIN_RAM} MAX_RAM=${MINECRAFT_SERVER_MAX_RAM} sh ./entrypoint.sh