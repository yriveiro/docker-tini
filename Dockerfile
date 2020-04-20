FROM alpine:3

LABEL maintainer="yago.riveiro@gmail.com"

ENV TINI_VERSION="v0.19.0" \
    TINI_SHA256="93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --no-cache --virtual .build-deps \
    curl==7.67.0-r0 && \
    curl -L --fail --silent --show-error "https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini" > /sbin/tini && \
    echo "${TINI_SHA256}  /sbin/tini" | sha256sum -c -s && \
    chmod +x /sbin/tini && \
    apk del .build-deps
