# Prepare user
## Commands
| Command | Description |
| --- | --- |
| usermod | modify user attributes |
| newgrp| update group membership without logging out |
---

## Tasks
### 1. Add the admin user to the docker group
**`sudo usermod -aG docker admin`**  

### 2. Update group membership
**`newgrp docker`**  

### 3. Test if the admin user can now access docker 
**`docker ps`**\

