# Compose
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
---
Files can be found here: [Lab09](../../lab/09)

## Tasks
### 1. Navigate to lab 09 and list the content

### 2. Bring the application up
```bash
podman-compose up -d
```

### 3. Inspect the containers and networks
```bash
podman ps
podman network ls
```

### 4. Inspect the **Containerfile**
```bash
cat Containerfile
```

### 5. Inspect the **compose.yaml** file
```bash
cat compose.yaml
```

### 6. Delete the application
```bash
podman compose down
```

### 7. Check the stopped containers
```bash
podman container ls -a
```
