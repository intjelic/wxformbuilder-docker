# wxFormBuilder in Docker

This repository contains a Dockerfile to create a Docker image allowing you to run wxFormBuilder from a Docker container.

## Instructions

Build the Docker image first.

```
docker build -t wxformbuilder .
```

Run wxFormBuilder from a Docker container.

```
docker run --net=host -e "DISPLAY=${DISPLAY:-:0.0}" -v /tmp/.X11-unix:/tmp/.X11-unix wxformbuilder
```

You may need to authorize Docker to run a client using your X11 server.

```
xhost + local:docker
```

Voilà.

