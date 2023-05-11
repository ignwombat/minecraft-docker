# Minecraft Docker
A dockerized application designed to run a Minecraft server automatically on startup.

The advantages of Dockerizing a Minecraft server:
- Run the server on any operating system that supports Docker
- Easily run multiple servers with altering Java versions
- Automatically launch your servers on system startup
- More consistent software conditions, making troubleshooting easier

## Requirements
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

# Setup

## 1. Clone the repository
`git clone https://github.com/ignwombat/minecraft-docker`

## 2. Download the desired Java version
Minecraft servers require Java to be installed on the system to run. You need to download a version of java into the [**docker**](./docker) folder

- To run Minecraft on version **1.19.x**, [Java 17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html) is required
- Other versions, such as modded 1.12.2 use [Java 8](https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html) instead

To avoid any issues, make sure to download the **tar.gz Linux x64 archive**

**Do not extract the archive!**

## 3. Rename the Java archive
By default, the [Docker Compose File](./docker-compose.yml) searches for **java.tar.gz**. Rename the archive to this.

## 4. Download a server jarfile
Save the jarfile as **server.jar** into the [**docker**](./docker) folder
- [Spigot](https://getbukkit.org/download/spigot)
- [CraftBukkit](https://getbukkit.org/download/craftbukkit)
- [Paper](https://papermc.io/downloads/paper)

## 5. Add extra content
All files inside the [data](./docker/date) folder get copied to the root directory of the server. Any additional configuration of the server, such as plugins, mods or scripts should be added here.

If you want to use a custom world, add the save in the root directory, and make sure the name corresponds with level-name in [server.properties](./docker/data/server.properties). The default name is "world".

This is also where you can edit the [server.properties](./docker/data/server.properties) file.

**Note:** if you place a "world" or "config" folder in the data directory, these will be ignored, as they are accessed in root.

## 6. Start the server with docker compose
**Make sure the terminals current working directory (CWD) is in the root folder.**

If it's the first time launching the server, or any changes have been made to the files, run the following command:
```shell
docker compose up -d
```

Otherwise, run the following command:
```shell
docker compose start -d
```

To send a command to the server:
```shell
docker compose exec -d minecraft say hello
```

To gracefully shut down the server:
```shell
docker compose exec -d minecraft stop
docker compose stop
```

## Changing the server port
Because [minecraft.env](./minecraft.env) doesn't load before docker compose, you must either change the [Docker Compose File](./docker-compose.yml) directly, or add a file named **.env** with the following contents:
```env
MINECRAFT_SERVER_PORT=25566
```

## Plugin configs
If you're using plugins that require configuration files, the config folder will be available in the root folder after the first launch, similar to the world folder.
