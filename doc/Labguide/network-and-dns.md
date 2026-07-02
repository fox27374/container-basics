# Network and DNS
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
---

## Tasks
### 1. Create two new networks **NET1** and **NET2**
```bash
podman network create NET1
podman network create NET2
```

### 2. List networks
```bash
podman network ls
```

### 3. Start a new nginx container called web1 and attach it to NET1
```bash
podman run -d --name web1 --network NET1 docker.io/nginx:alpine
```

### 4. Interactively start a new container and attach it to NET1
```bash
podman run -it --network NET1 --rm docker.io/alpine:latest
```

### 5. From within the container, try to ping web1
```bash
ping web1
```

### 6. Exit the container and start it again, attaching it to NET2
```bash
podman run -it --network NET2 --rm docker.io/alpine:latest
```

### 7. Try to ping web1 again
```bash
ping web1
```

### 8. Remove the networks
```bash
podman stop web1
podman container prune
podman network prune
```
