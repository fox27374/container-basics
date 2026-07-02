# Change data
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
| vi | the best editor out there |
| cd | change directory |
| cat | concatenate file contents |
| sed | stream editor |
---

## Tasks
### 1. Open an interactive shell
```bash
podman exec -it web /bin/sh
```

### 2. Navigate to the webserver root directory
```bash
cd /usr/share/nginx/html
```

### 3. Display the contents of index.html
```bash
cat index.html
```

### 4. Install text editor
```bash
apk add nano
```

### 5. Change the content of the index.html file
```bash
nano index.html
```

### 6. View the changes in your browser