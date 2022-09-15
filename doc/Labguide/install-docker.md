# Install Docker
## Commands
| Command | Description |
| --- | --- |
| apt | debian package manager |
| mkdir | create directory |
| curl | tool to interact with websites |
| echo | display input on stdout |
---

https://docs.docker.com/engine/install/debian/

## Tasks
### 1. Update the apt repository
**`sudo apt update`**  

### 2. Install dependencies
**`sudo apt install ca-certificates curl gnupg lsb-release`**  

### 3. Add Docker’s official GPG key
**`sudo mkdir -p /etc/apt/keyrings`**
**`curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`**

### 4. Add Docker repo to aps sources
**`echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`**

### 5. Install the Docker engine
**`sudo apt update`**
**`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin`**
