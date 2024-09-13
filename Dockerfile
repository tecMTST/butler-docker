FROM alpine:3.20.3 AS downloader

ENV BUTLER_VERSION=15.21.0

WORKDIR /app

RUN apk update && \
  apk add curl zip libc6-compat && \
  curl -L https://broth.itch.zone/butler/linux-amd64/${BUTLER_VERSION}/archive/default -o /app/butler.zip && \
  unzip /app/butler.zip && \
  rm /app/butler.zip && \
  chmod +x butler && \
  apk del curl zip && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["/app/butler"]
CMD ["-h"]

