# Push to dockerhub
## Commands
| Command | Description |
| --- | --- |
| docker | image and container command line interface |
---

## Tasks
### 1. Create a new repository in your Dockerhub account called **pinger**

### 2. Login to Dockerhub from the CLI
```bash
docker login
```

### 3. Build the image with the corresponding repository tag
```bash
docker build -t DOCKERHUB_NAME/pinger:2 -f Dockerfile2 .
```

### 4. Push the image to Dockerhub
```bash
docker push DOCKERHUB_NAME/pinger:2
```

### 5. Check if the image is available in your repository

### 6. Delete the local image
```bash
docker image rm pinger:2
```

### 7. Stop and delete the running container
```bash
docker stop pinger2
docker container prune
```

### 8. Delete the local image
```bash
docker image rm DOCKERHUB_NAME/pinger:2
```

### 9. Start a new container with the image from Dockerhub
```bash
docker run -d --name pinger-from-dockerhub DOCKERHUB_NAME/pinger:2
```

### 10. Check if the container is running
```bash
docker ps
```
