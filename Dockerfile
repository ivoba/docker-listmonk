FROM alpine:3.10

ARG LISTMONK_VERSION=0.2.0-alpha

WORKDIR /listmonk
RUN apk --no-cache add ca-certificates wget libintl \
&& apk add --virtual build_deps gettext \
&& cp /usr/bin/envsubst /usr/local/bin/envsubst \
&& apk del gettext \
&& wget https://github.com/knadh/listmonk/releases/download/v${LISTMONK_VERSION}/listmonk_${LISTMONK_VERSION}_linux_amd64.tar.gz \
&& tar xzf listmonk_${LISTMONK_VERSION}_linux_amd64.tar.gz \
&& rm listmonk_${LISTMONK_VERSION}_linux_amd64.tar.gz INSTALL.md LICENSE README.md

COPY config.toml.sample config.toml.sample

CMD envsubst < config.toml.sample > config.toml && ./listmonk
