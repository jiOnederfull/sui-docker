# sui-docker; dockerbuild
Dockerfile for sui-node built in docker.


## TLDR;
```
git clone --recurse-submodules https://github.com/jiOnederfull/sui-docker
```
```
cd sui-docker/dockerbuild
```
```
docker run -d -v $PWD/config:/opt/sui/config -v $PWD/db:/opt/sui/db -p 8080:8080 -p 9184:9184 -p 9000:9000 --name sui-dockerbuild jionederfull/sui-docker:dockerbuild
```
```
docker logs -f sui-dockerbuild
```
```
docker stop sui-dockerbuild
```


## Build docker image
```
git clone --recurse-submodules https://github.com/jiOnederfull/sui-docker
```
```
cd sui-docker/dockerbuild
```
- Change the version of your choice.
```
docker build --build-arg git_checkout_arg=mainnet-v1.27.2 -t ${IMAGE_NAME} .
```


## Edit fullnode.yaml with preferred settings
```
config
├── fullnode.yaml
└── genesis.blob
``` 
- The configuration files(`fullnode.yaml` and `genesis.blob`) are located below `config`.


## Start the Sui full node
```
cd ${PATH}/sui-docker/dockerbuild
```
```
docker run -d -v $PWD/config:/opt/sui/config -v $PWD/db:/opt/sui/db -p 8080:8080 -p 9184:9184 -p 9000:9000 --name ${CONTAINER_NAME} ${IMAGE_NAME}
```


## Check the logs
```
docker logs -f ${CONTAINER_NAME}
```


## Stop the Sui full node
```
docker stop ${CONTAINER_NAME}
```

- ref: https://github.com/MystenLabs/sui/blob/main/docker/sui-node/Dockerfile
