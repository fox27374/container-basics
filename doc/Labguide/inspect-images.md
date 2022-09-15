# Inspect images
## Commands
| Command | Description |
| --- | --- |
| docker | image and container command line interface |
| curl | tool to interact with websites |
---

## Tasks
### 1. List all images
**`docker image ls`**  

### 2. Stop and delete the container
**`docker stop CONTAINER_NAME`**\
**`docker container prune`**

### 3. Delete the image
**`docker image rm nginx`**

### 4. Check if the image is deleted 
**`docker image ls`**

### 5. Run a new container - note that the image is going to be downloaded
**`docker run -d -p 8080:80 nginx`**

### 6. Start a second container - note that no image download is needed
**`docker run -d -p 8081:80 nginx`**

### 7. Explore Dockerhub 
Go to [Dockerhub](https://hub.docker.com) and have a look at the Nginx images

### 8. Start a new container based on a different image tag
**`docker run -d -p 8082:80 nginx:alpine`**

### 9. Display all containers
**`docker container ls -a`**

### 10. Create a new container with port forwarding
**`docker run -d -p 8080:80 nginx`**

### 11. Display the running containers to check the port forwarding
**`docker ps`**

### 12. Check the open ports
**`netstat -tulpn | grep 80`**

### 13. Try if the webserver is answering
**`curl localhost:8080`**
