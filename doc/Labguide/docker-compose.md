# Docker compose
## Commands
| Command | Description |
| --- | --- |
| docker | image and container command line interface |
---
```
FROM splunk/splunk:latest
WORKDIR /opt/splunk/etc/apps
USER root
RUN wget https://botsdataset.s3.amazonaws.com/botsv3/botsv3_data_set.tgz
RUN tar -xvf botsv3_data_set.tgz
```
```
version: "3.8"
services:
  splunk:
    image: "splunk:workshop"
    ports:
      - "8000:8000"
    environment:
      - "SPLUNK_START_ARGS=--accept-license"
      - "SPLUNK_PASSWORD=testtest123"
```
## Tasks
### 1. Create a file named **docker-compose.yaml** and paste the following content
```yaml
version: "3.8"
services:
  web:
    image: "nginx"
    volumes:
      - "/home/admin/web-content:/usr/share/nginx/html"
    ports:
      - "8080:80"

  pinger2:
    image: "fox27374/pinger:2"

  pinger1:
    build:
      dockerfile: Dockerfile1

  alpine:
    image: "alpine"
    entrypoint: ["/usr/bin/tail", "-f", "/dev/null"]
```

### 2. Bring the application up
**`docker compose up -d`**  

### 3. Inspect the containers and networks
**`docker ps`**\
**`docker network ls`**

### 4. Delete the application
**`docker compose down`**

