# Build Splunk custom image
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
FROM splunk/splunk:latest
WORKDIR /opt/splunk/etc/apps
USER root
RUN wget https://botsdataset.s3.amazonaws.com/botsv3/botsv3_data_set.tgz
RUN tar -xvf botsv3_data_set.tgz
```

### 2. Build the new image and add a tag
**`docker build -t splunk:workshop .`**

### 3. List the newly created image 
**`docker image ls`**
