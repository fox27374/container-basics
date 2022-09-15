# Build image
## Commands
| Command | Description |
| --- | --- |
| docker | image and container command line interface |
| vi | the best editor out there |
---

## Tasks
### 1. Create a new file called Dockerfile and paste the content
**`vi Dockerfile`**  
```dockerfile
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
```

### 2. Create a new file called **index.html** in with the content
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>NTSLab Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="jumbotron text-center">
  <h1>NTSLab example page</h1>
  <p>Awesome, its responsive!</p> 
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>NTSLab</h3>
      <p>This website runs on a Linux server using nginx webserver</p>
      <p>You did it! Was not that hard, wasn't it?</p>
    </div>
    <div class="col-sm-4">
      <h3>Github</h3>
      <p>Jump to the Github Labguide for more info</p>
      <p><a href="https://github.com/fox27374/container-basics">Container Basics</a></p>
    </div>
    <div class="col-sm-4">
      <h3>Nginx</h3>        
      <p>For more info on the nginx project go to ...</p>
      <p><a href="https://www.nginx.com/">www.nginx.com</a></p>
    </div>
  </div>
</div>

</body>
</html>
```

### 3. Build the new image and add a tag
**`docker build -t nginx:nts .`**

### 4. List the newly created image 
**`docker image ls`**

### 5. Stop and delete all running containers
**`docker stop CONTAINER_NAME`**\
**`docker container prune`**

### 6. Run a container based on the newly created image
**`docker run -d -p 8080:80 --name web nginx:nts`**

### 7. Check if the index.html file is displayed in the browser 
