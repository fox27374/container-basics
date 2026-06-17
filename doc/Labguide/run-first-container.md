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
**`podman run -d docker.io/nginx`**  

### 2. Get the container details
**`podman container ls`**  

### 3. Check the open ports 
**`ss -tulpn`**

### 4. Stop the container 
**`podman stop CONTAINER_NAME`**

### 5. Display all containers
**`podman container ls -a`**

### 6. Start the stopped container 
**`podman start CONTAINER_ID`**

### 7. Check the running container 
**`podman ps`**

### 8. Stop and delete the container 
**`podman stop CONTAINER_NAME`**\
**`podman container prune`**

### 9. Display all containers
**`podman container ls -a`**

### 10. Create a new container with port forwarding
**`podman run -d -p 8080:80 docker.io/nginx`**

### 11. Display the running containers to check the port forwarding
**`podman ps`**

### 12. Check the open ports
**`ss -tulpn | grep 8080`**

### 13. Try if the webserver is answering
**`curl localhost:8080`**
