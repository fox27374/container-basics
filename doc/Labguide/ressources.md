# Ressources
## Commands
| Command | Description |
| --- | --- |
| docker | image and container command line interface |
---

## Tasks
### 1. Start a container with ressource limitations and restart policy
**`docker run -d --name web-nts -p 8080:80 --memory 10M --cpus 0.5 --restart unless-stopped nginx:nts`**  

### 2. View the memory consumption
**`docker stats`**  

### 3. Kill the nginx process (find PID first)
**`ps -ef | grep nginx`**\
**`kill -9 PID`**

### 4. Check the uptime of the container
**`docker ps`**

