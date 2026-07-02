# Bind mount
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
| vi | the best editor out there |
| mkdir | create a directory |
---
Files can be found here: [Lab04](../../lab/04)

## Tasks
### 1. Stop and delete all running containers
```bash
podman stop web
podman container prune
```

### 2. Create a new folder and move the index.html file into it
```bash
mkdir web-content
mv index.html web-content/
```

### 3. Start a container with a bind mount 
```bash
podman run -d -p 8080:80 -v $(pwd)/web-content:/usr/share/nginx/html --name web docker.io/nginx:alpine
```

### 4. Check if the index.html file is displayed in the browser 

### 5. Modify the local index.html file 
```bash
vi web-content/index.html
```

### 6. Check if the content is also changed in the browser 
