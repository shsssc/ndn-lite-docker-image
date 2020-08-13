# ndn-lite-docker-image
The docker image of ndn-lite development environment. It will automatically start the iot-controller at `localhost:6060` and install all the dependencies. 

## Build
To build the image locally, you can use

```shell
docker build --tag ndnlite:0.1 .
```

## Run
To start the image, use the commands

```shell
docker run -d -p6060:6060 --name ndnlite-container ndnlite:0.1 #start the container
docker exec -it ndnlite-container /bin/bash #run shell in the container
```

## Stop

```shell
docker stop ndnlite-container
```
