# Build image advanced
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
| vi | the best editor out there |
---
Files can be found here: [Lab06](../../lab/06)

## Tasks
### 1. Create a new file called **uptime.sh** with the content
This little script does an uptime check of **www.google.at**. It first resolves
the host via DNS and logs `DNS OK` when it gets entries back, then it runs 5
pings and logs the mean round-trip time in ms. The check repeats every 30s.
```bash
vi uptime.sh
```
```bash
#!/bin/sh
HOST=www.google.at

while true; do
    # 1. DNS check
    if nslookup "$HOST" >/dev/null 2>&1; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') DNS OK"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') DNS FAILED"
        sleep 30
        continue
    fi

    # 2. Ping check - mean ms over 5 pings
    avg=$(ping -c 5 "$HOST" | awk -F'/' '/rtt|round-trip/ {print $5}')
    echo "$(date '+%Y-%m-%d %H:%M:%S') Ping mean: ${avg} ms"

    sleep 30
done
```

### 2. Create a new file called **Containerfile1** and paste the content
```bash
vi Containerfile1
```
```dockerfile
FROM docker.io/alpine:latest

RUN apk add iputils

COPY uptime.sh .

CMD ["sh", "uptime.sh"]
```

### 3. Build the image
```bash
podman build -t uptimecheck:1 -f Containerfile1 .
```

### 4. Run a new container based on the created image and give it a name
```bash
podman run -d --name uptimecheck1 uptimecheck:1
```

### 5. Check the container logs to see the uptime check running
```bash
podman logs -f uptimecheck1
```

### 6. Exec into the container
```bash
podman exec -it uptimecheck1 /bin/sh
```

### 7. Display the running processes in the container
```bash
ps
```

### 8. Note the user that is running the "sh uptime.sh" process

### 9. Exit the container
```bash
exit
```

### 10. Create a new file called **Containerfile2** and paste the content
```bash
vi Containerfile2
```
```dockerfile
FROM docker.io/alpine:3.24.1

RUN apk add --no-cache iputils

# Set variables
ENV USER=uptimecheck
ENV GROUP=uptimecheck
ENV HOME=/home/$USER

# Create user and group
RUN addgroup $GROUP
RUN adduser -G $GROUP -h $HOME -D $USER

# Use new directory and user
WORKDIR $HOME
USER $USER

COPY --chown=$USER:$GROUP uptime.sh .

CMD ["sh", "uptime.sh"]
```

### 11. Build the image
```bash
podman build -t uptimecheck:2 -f Containerfile2 .
```

### 12. Run a new container based on the created image and give it a name
```bash
podman run -d --name uptimecheck2 uptimecheck:2
```

### 13. Exec into the container and check the processes
```bash
podman exec -it uptimecheck2 /bin/sh
ps
```

### 14. Note the user running the process

### 15. Exec into the first container again and install nc and ssh
```bash
podman exec -it uptimecheck1 /bin/sh
apk add --no-cache netcat-openbsd openssh-client
```

### 16. Scan for open SSH ports
```bash
for i in $(seq 1 64); do
    ( nc -z -w1 10.42.22.$i 22 2>/dev/null && echo "10.42.22.$i: 22 open" ) &
done
wait
```

### 17. Connect to one of the discovered IPs with ssh
