#!/bin/bash
v=$(LC_COLLATE=C; /usr/bin/printf '%s\c' */)
./jre/${v}/bin/java -Xms${MIN_RAM} -Xmx${MAX_RAM} -jar server.jar nogui