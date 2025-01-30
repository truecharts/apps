FROM alpine:3.21.2@sha256:56fa17d2a7e7f168a043a2712e63aed1f8543aeafdcee47c58dcffe38ed51099

ARG CONTAINER_NAME
ARG CONTAINER_VER

ENV XDG_CONFIG_HOME=/config
ENV UMASK=0002

USER root

SHELL ["/bin/sh", "-o", "pipefail", "-c"]

WORKDIR /app

# hadolint ignore=DL3018
RUN \
  apk update && apk add --no-cache jq nano ca-certificates bash util-linux coreutils grep procps git\
  && addgroup apps -g 568 \
  && adduser apps -u 568 -g 568 -D -S -H \
  && mkdir -p /config \
  && chown -R apps:apps /config \
  && chmod -R 775 /config \
  && chown -R apps:apps /app \
  && chmod -R 775 /app \
  && update-ca-certificates

VOLUME [ "/config" ]

USER apps

COPY ./containers/base/alpine/entrypoint.sh /entrypoint.sh
COPY ./containers/base/alpine/shim /etc/profile.d

ENTRYPOINT ["/bin/ash", "--"]

LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
