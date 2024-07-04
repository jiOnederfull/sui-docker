FROM --platform=linux/amd64 ubuntu:20.04

WORKDIR /opt/sui

EXPOSE 8080
EXPOSE 9184
EXPOSE 9000

CMD ["/opt/sui/bin/sui-node", "--config-path", "/opt/sui/config/fullnode.yaml"]
