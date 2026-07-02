# Inspect images
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
| curl | tool to interact with websites |
---

## Tasks
### 1. List all images
```bash
podman image ls
```

### 2. Stop and delete the container
```bash
podman stop CONTAINER_NAME
podman container prune
```

### 3. Delete the image
```bash
podman image rm docker.io/nginx
```

### 4. Check if the image is deleted 
```bash
podman image ls
```

### 5. Run a new container - note that the image is going to be downloaded
```bash
podman run -d -p 8080:80 docker.io/nginxnginx
```

### 6. Start a second container - note that no image download is needed
```bash
podman run -d -p 8081:80 docker.io/nginxnginx
```

### 7. Explore Dockerhub 
Go to [dockerhub](https://hub.docker.com) and have a look at the Nginx images

### 8. Start a new container based on a different image tag
```bash
podman run -d -p 8082:80 docker.io/nginx:alpine
```
