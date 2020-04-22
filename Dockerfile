FROM alpine:3

LABEL maintainer="yago.riveiro@gmail.com"

ENV TINI_VERSION="v0.19.0" \
    TINI_SHA256="041cf16f883309c1f5a7a6c5ba716059b3ea456118fa72115db67edeed1c77db"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --no-cache --virtual .build-deps \
    curl==7.67.0-r0 \
    bash=5.0.11-r1 && \
    curl -L --fail --silent --show-error "https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-muslc-amd64" > /sbin/tini && \
    # echo "${TINI_SHA256}  /sbin/tini" | sha256sum -c -s && \
    chmod +x /sbin/tini
