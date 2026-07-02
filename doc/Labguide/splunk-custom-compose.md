# Run Splunk image with compose
## Commands
| Command | Description |
| --- | --- |
| podman-compose | image and container command line interface |
| vi | the best editor out there |
---

## Tasks
### 1. Create a new file called compose.yaml and paste the content
```bash
vi compose.yaml
```
```yaml
version: "3.8"
services:
  splunk:
    image: "splunk:workshop"
    ports:
      - "8000:8000"
    environment:
      - "SPLUNK_START_ARGS=--accept-license"
      - "SPLUNK_PASSWORD=testtest123"
```

### 2. Run the container with podman-compose
```bash
podman-compose up -d
```
