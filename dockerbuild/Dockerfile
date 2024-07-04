# Build environment
FROM rust:1.75-bullseye AS builder
RUN apt-get update && apt-get install -y cmake clang

WORKDIR /opt/sui

ARG git_checkout_arg

RUN git clone https://github.com/MystenLabs/sui .
RUN git checkout $git_checkout_arg

RUN cargo build --release --bin sui-node


# Final image
FROM debian:bullseye-slim AS runtime
# Use jemalloc as memory allocator
RUN apt-get update && apt-get install -y libjemalloc-dev ca-certificates curl
ENV LD_PRELOAD /usr/lib/x86_64-linux-gnu/libjemalloc.so

WORKDIR /opt/sui

COPY --from=builder /opt/sui/target/release/sui-node /opt/sui/bin/sui-node

RUN chmod +x /opt/sui/bin/sui-node


EXPOSE 8080
EXPOSE 9184
EXPOSE 9000

CMD ["/opt/sui/bin/sui-node", "--config-path", "/opt/sui/config/fullnode.yaml"]
