# sui-docker
- Dockerfile for sui full node.
- [jionederfull/sui-docker](https://hub.docker.com/repository/docker/jionederfull/sui-docker/general)
```
sui-docker
├── README.md
├── dockerbuild
│   ├── Dockerfile
│   ├── README.md
│   └── config
│       ├── fullnode.yaml
│       └── genesis.blob
└── localbuild
    ├── Dockerfile
    ├── README.md
    ├── bin
    ├── build-sui-node.sh
    ├── config
    │   ├── fullnode.yaml
    │   └── genesis.blob
    └── sui(https://github.com/MystenLabs/sui)
```

## Locally
- If you want to build `sui-node` locally, follow the link: [localbuild](https://github.com/jiOnederfull/sui-docker/tree/main/localbuild)

## Using Docker
- If you want to build `sui-node` using docker, follow the link: [dockerbuild](https://github.com/jiOnederfull/sui-docker/tree/main/dockerbuild)

## Test metrics
```
curl localhost:9184/metrics
```

## Test RPC Query
```
curl ${ENDPOINT} \
--request POST \
--header "Content-Type: application/json" \
--data '{ "jsonrpc": "2.0", "method": "rpc.discover", "id": 1 }'
```
