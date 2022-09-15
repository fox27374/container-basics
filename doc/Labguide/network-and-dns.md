# Network and DNS
## Commands
| Command | Description |
| --- | --- |
| docker | image and container command line interface |
---

## Tasks
### 1. Create two new networks **NET1** and **NET2**
**`docker network create NET1`**\
**`docker network create NET2`**

### 2. Start a new nginx container called web1 and attach it to NET1
**`docker run -d --name web1 --network NET1 nginx`**  

### 3. Interactively start a new busybox and also attach it to NET1
**`docker run -it --network NET1 --rm busybox`**

### 4. From within the container, try to ping web1
**`ping web1`**

### 5. Exit the container and start it again, attaching it to NET2
**`docker run -it --network NET2 --rm busybox`**

### 6. Try to ping web1 again
**`ping web1`**

### 7. Try to ping a public IP
**`ping www.google.at`**
