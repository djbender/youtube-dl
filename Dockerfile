FROM alpine:3.13

RUN set -eux; \
  \
  apk add --update-cache --no-cache \
    ffmpeg \
    youtube-dl \
    zlib \
  \
  && apk add --virtual .buildDeps --update-cache --no-cache \
    build-base \
    cmake \
    linux-headers \
    make \
    zlib-dev \
  \
  && wget -qO- https://github.com/wez/atomicparsley/archive/20210114.184825.1dbe1be.tar.gz \
    | tar xvz -C /tmp \
  \
  && cd /tmp/atomicparsley-20210114.184825.1dbe1be \
  && cmake . \
  && cmake --build . --config Release \
  && install AtomicParsley /usr/local/bin/AtomicParsley \
  && apk del .buildDeps
