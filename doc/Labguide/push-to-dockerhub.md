# Push to dockerhub
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
---

## Tasks
### 1. Create a new repository in your Dockerhub account called **pinger**

### 2. Login to Dockerhub from the CLI
```bash
podman login docker.io
```

### 3. Build the image with the corresponding repository tag
```bash
podman build -t DOCKERHUB_NAME/pinger:2 -f Containerfile2 .
```

### 4. Push the image to Dockerhub
```bash
podman push DOCKERHUB_NAME/pinger:2
```

### 5. Check if the image is available in your repository

### 6. Delete the local image
```bash
podman image rm pinger:2
```

### 7. Stop and delete the running container
```bash
podman stop pinger2
podman container prune
```

### 8. Delete the local image
```bash
podman image rm DOCKERHUB_NAME/pinger:2
```

### 9. Start a new container with the image from Dockerhub
```bash
podman run -d --name pinger-from-dockerhub DOCKERHUB_NAME/pinger:2
```

### 10. Check if the container is running
```bash
podman ps
```
