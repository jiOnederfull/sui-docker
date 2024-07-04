# sui-docker; localbuild
Dockerfile for sui-node built in local.


## TLDR;
```
git clone --recurse-submodules https://github.com/jiOnederfull/sui-docker
```
```
cd sui-docker/localbuild
```
```
docker run -d -v $PWD:/opt/sui -p 8080:8080 -p 9184:9184 -p 9000:9000 --name sui-localbuild jionederfull/sui-docker:localbuild
```
```
docker logs -f sui-localbuild
```
```
docker stop sui-localbuild
```


## Build sui-node
```
git clone --recurse-submodules https://github.com/jiOnederfull/sui-docker
```
```
cd sui-docker/localbuild
```
- Change the version of your choice or it would build for the current tag.
```
./build-sui-node.sh mainnet-v1.27.2
```


## Build docker image
```
docker build -t ${IMAGE_NAME} .
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
cd ${PATH}/sui-docker/localbuild
```
```
docker run -d -v $PWD:/opt/sui -p 8080:8080 -p 9184:9184 -p 9000:9000 --name ${CONTAINER_NAME} ${IMAGE_NAME}
```


## Check the logs
```
docker logs -f ${CONTAINER_NAME}
```


## Stop the Sui full node
```
docker stop ${CONTAINER_NAME}
```
