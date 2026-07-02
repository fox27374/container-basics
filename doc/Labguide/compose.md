# Compose
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
---
## Tasks
### 1. Create a file named **compose.yaml** with the following content
```yaml
services:
  web1:
    image: "docker.io/nginx:alpine"
    volumes:
      - type: bind
        source: "./web-content"
        target: "/usr/share/nginx/html"
    ports:
      - "8080:80"

  web2:
    build:
      dockerfile: Containerfile
    ports:
      - "8081:80"

  alpine:
    image: "docker.io/alpine:latest"
    entrypoint: ["/usr/bin/tail", "-f", "/dev/null"]
```

### 2. Bring the application up
```bash
podman-compose up -d
```

### 3. Inspect the containers and networks
```bash
podman ps
podman network ls
```

### 4. Delete the application
```bash
podman compose down
```
