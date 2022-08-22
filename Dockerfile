FROM lomot/minecraft-bedrock:1.19.20.02 as minebuilder

FROM 05jchambers/legendary-bedrock-container:latest

LABEL maintainer="Tristan Morgan <tristan.morgan@gmail.com>"
LABEL Description="Minecraft Bedrock plus Box64"

COPY --from=minebuilder /mcpe /mcpe


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
