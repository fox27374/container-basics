# Change data
## Commands
| Command | Description |
| --- | --- |
| docker | image and container command line interface |
| vi | the best editor out there |
| cd | change directory |
| cat | concatenate file contents |
| sed | stream editor |
---

## Tasks
### 1. Open an interactive shell
**`docker exec -it web /bin/bash`**  

### 2. Navigate to the webserver root directory
**`cd /usr/share/nginx/html`**

### 3. Display the contents of index.html
**`cat index.html`**

### 4. Replace line in file 
**`sed -i 's/NTSLab/XYZXYZ/g' index.html`**

### 5. Check the browser if the content has changed
