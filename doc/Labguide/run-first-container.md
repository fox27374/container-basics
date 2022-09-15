# Run first container
## Commands
| Command | Description |
| --- | --- |
| docker | image and container command line interface |
| netstat| list network information |
| curl | tool to interact with websites |
---

## Tasks
### 1. Run an nginx container
**`docker run -d nginx`**  

### 2. Get the container details
**`docker container ls`**  

### 3. Check the open ports 
**`netstat -tulpn`**

### 4. Stop the container 
**`docker stop CONTAINER_NAME`**

### 5. Display all containers
**`docker container ls -a`**

### 6. Start the stopped container 
**`docker start CONTAINER_ID`**

### 7. Check the running container 
**`docker ps`**

### 8. Stop and delete the container 
**`docker stop CONTAINER_NAME`**\
**`docker container prune`**

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
