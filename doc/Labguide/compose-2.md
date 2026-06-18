# Compose
## Commands
| Command | Description |
| --- | --- |
| podman | image and container command line interface |
---
## Tasks
### 1. Create a file named **compose.yaml** with the following content
```yaml
services:
  wordpress:
    image: docker.io/wordpress:7.0.0-php8.3-apache
    restart: always
    ports:
      - 8080:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: unicorn
      WORDPRESS_DB_PASSWORD: letmein
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - wordpress:/var/www/html

  db:
    image: docker.io/mysql:8.0
    restart: always
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: unicorn
      MYSQL_PASSWORD: letmein
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    volumes:
      - db:/var/lib/mysql

volumes:
  wordpress:
  db:
```

### 2. Bring the application up
**`podman-compose up -d`**  

### 3. Inspect the containers and networks
**`podman ps`**\
**`podman network ls`**

### 4. Check the website of the container and finish the Wordpress setup

### 5. Delete the application
**`podman compose down`**

