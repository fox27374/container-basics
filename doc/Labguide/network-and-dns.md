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

### 2. Start a new nginx container called web1 and attach it to NET1
```bash
podman run -d --name web1 --network NET1 docker.io/nginx:alpine
```

### 3. Interactively start a new busybox and also attach it to NET1
```bash
podman run -it --network NET1 --rm docker.io/alpine:latest
```

### 4. From within the container, try to ping web1
```bash
ping web1
```

### 5. Exit the container and start it again, attaching it to NET2
```bash
podman run -it --network NET2 --rm docker.io/alpine:latest
```

### 6. Try to ping web1 again
```bash
ping web1
```

### 7. Remove the networks
```bash
podman stop web1
podman container prune
podman network prune
```
