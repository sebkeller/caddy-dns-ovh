# syntax = docker/dockerfile:1

FROM registry.docker.com/library/caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/ovh \
    --with github.com/caddyserver/caddy/v2=github.com/caddyserver/caddy/v2@${CADDY_VERSION}

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
