ARG mcversion
FROM lomot/minecraft-bedrock:${mcversion} as builder

FROM --platform=linux/arm64/v8 debian:bullseye-slim

LABEL maintainer="Tristan Morgan <tristan.morgan@gmail.com>"
LABEL Description="Minecraft Bedrock plus Box64"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Get Box64
RUN apt-get update && apt-get install ca-certificates gpg libcurl4 -y
ADD https://ryanfortner.github.io/box64-debs/box64.list /etc/apt/sources.list.d/box64.list
ADD https://ryanfortner.github.io/box64-debs/KEY.gpg /tmp/KEY.gpg
RUN cat /tmp/KEY.gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg
RUN apt-get update && apt-get install box64-rpi4arm64 -y && apt-get remove gpg -y && apt autoremove -y && apt-get clean

# copy minecraft bedrock server
RUN mkdir -p /lib64 && mkdir -p /lib/x86_64-linux-gnu
COPY --from=builder /lib64 /lib64
COPY --from=builder /lib/x86_64-linux-gnu /lib/x86_64-linux-gnu
COPY --from=builder /mcpe /mcpe

COPY script/docker-entrypoint.sh /mcpe/script/docker-entrypoint.sh

ENV SERVER_HOME="/mcpe" \
  SERVER_PATH="/mcpe/server" \
  SCRIPT_PATH="/mcpe/script" \
  DEFAULT_CONFIG_PATH="/mcpe/default-config" \
  DATA_PATH="/data"

# IPV4 Ports
EXPOSE 19132/udp

# IPV6 Ports
EXPOSE 19133/udp

# RUN
ENTRYPOINT ["/mcpe/script/docker-entrypoint.sh"]
CMD ["/mcpe/server/bedrock_server"]
