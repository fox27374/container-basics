# Build image advanced
## Commands
| Command | Description |
| --- | --- |
| docker | image and container command line interface |
| vi | the best editor out there |
---

## Tasks
### 1. Create a new file called **ping.sh** in with the content
**`vi ping.sh`**
```bash
#!/bin/ss
ping www.google.at
```

### 2. Create a new file called **Dockerfile1** and paste the content
**`vi Dockerfile1`**  
```dockerfile
FROM alpine:latest

RUN apk update
RUN apk add iputils

COPY ping.sh .

CMD ["sh", "ping.sh"]
```

### 3. Build the image
**`docker build -t pinger:1 -f Dockerfile1 .`**

### 4. Run a new container based on the created image and give it a name
**`docker run -d --name pinger1 pinger:1`**

### 5. Inspect the running processes
**`ps -ef | grep ping`**

### 6. Exec into the container
**`docker exec -it pinger1 /bin/sh`**

### 7. Display the running processes in the container
**`ps`**

### 8. Note the user that is running the "sh ping.sh" process

### 9. Exit the container
**`ps`**

### 10. Create a new file called **Dockerfile2** and paste the content
**`vi Dockerfile2`**  
```dockerfile
FROM alpine:latest

RUN apk update
RUN apk add iputils

# Set variables
ENV USER=pinger
ENV GROUP=pinger
ENV HOME /home/$USER

# Create user and group
RUN addgroup $GROUP
RUN adduser -G $GROUP -h $HOME -D $USER

# Use new directory and user
WORKDIR $HOME
USER $USER

COPY --chown=$USER:$GROUP ping.sh .

CMD ["sh", "ping.sh"]
```

### 11. Build the image
**`docker build -t pinger:2 -f Dockerfile2 .`**

### 12. Run a new container based on the created image and give it a name
**`docker run -d --name pinger2 pinger:2`**

### 13. Exec into the container and check the processes
**`docker exec -it pinger2 /bin/sh`**\
**`ps`**

