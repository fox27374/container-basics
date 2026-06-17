# Inspect images
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
| curl | tool to interact with websites |
---

## Tasks
### 1. List all images
**`podman image ls`**  

### 2. Stop and delete the container
**`podman stop CONTAINER_NAME`**\
**`podman container prune`**

### 3. Delete the image
**`podman image rm docker.io/nginx`**

### 4. Check if the image is deleted 
**`podman image ls`**

### 5. Run a new container - note that the image is going to be downloaded
**`podman run -d -p 8080:80 docker.io/nginxnginx`**

### 6. Start a second container - note that no image download is needed
**`podman run -d -p 8081:80 docker.io/nginxnginx`**

### 7. Explore podmanhub 
Go to [dockerhub](https://hub.docker.com) and have a look at the Nginx images

### 8. Start a new container based on a different image tag
**`podman run -d -p 8082:80 docker.io/nginx:alpine`**

