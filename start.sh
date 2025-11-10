#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Generate the certificates if they do not already exist
[ ! -f certs/server.crt ] && (cd certs && ./generate-certs.sh)

# Stop and remove existing container if it exists
docker rm -f evt-webserver 2>/dev/null

# Start the webserver
docker run -d \
  --name evt-webserver \
  -p 8443:8443 \
  -v "$SCRIPT_DIR":/usr/share/nginx/html:ro \
  -v "$SCRIPT_DIR/nginx/nginx.conf":/etc/nginx/nginx.conf:ro \
  -v "$SCRIPT_DIR/certs":/etc/nginx/certs:ro \
  nginx:alpine

echo "Open https://localhost:8443"