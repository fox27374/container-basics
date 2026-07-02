# Run first container
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
| ss | list network information |
| curl | tool to interact with websites |
---

## Tasks
### 1. Run an nginx container
```bash
podman run -d docker.io/nginx
```

### 2. Get the container details
```bash
podman container ls
```

### 3. Check the open ports 
```bash
ss -tulpn
```

### 4. Stop the container 
```bash
podman stop CONTAINER_NAME
```

### 5. Display all containers
```bash
podman container ls -a
```

### 6. Start the stopped container 
```bash
podman start CONTAINER_ID
```

### 7. Check the running container 
```bash
podman ps
```

### 8. Stop and delete the container 
```bash
podman stop CONTAINER_NAME
podman container prune
```

### 9. Display all containers
```bash
podman container ls -a
```

### 10. Create a new container with port forwarding
```bash
podman run -d -p 8080:80 docker.io/nginx
```

### 11. Display the running containers to check the port forwarding
```bash
podman ps
```

### 12. Check the open ports
```bash
ss -tulpn | grep 8080
```

### 13. Try if the webserver is answering
```bash
curl localhost:8080
```
