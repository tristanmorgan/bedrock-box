# bedrock-box
[![Docker Image](https://img.shields.io/badge/docker-tristanmorgan%2Fbedrock--box-blue.svg)](https://hub.docker.com/r/tristanmorgan/bedrock-box/)

A repackaging of [LomotHo/minecraft-bedrock](http://github.com/LomotHo/minecraft-bedrock/) but with [Box64](https://github.com/ptitSeb/box64) emulation.

## Usage

Essentially the same as lomot's except this runs on ARM64 hosts.

    docker run -d --name bedrock -p 19132:19132/udp \
      -v /opt/mcpe-data:/data \
      tristanmorgan/bedrock-box:latest

## Details

The Dockerfile takes the amd64 image by LomotHo and copies the Minecraft Server files and some libraries and copies them
to a new arm64 Debian base image. Then it adds Box64 and a modified entrypoint script so when the container is used it
wraps the Minecraft server with box64 to run on ARM (Raspberry Pi 4 specifically).

I typically run it with the following environment variables but these may not be optimal.

    DATA_PATH               = "/data"
    BOX64_LOG               = "INFO"
    BOX64_DYNAREC_SAFEFLAGS = 0
    BOX64_DYNAREC_BIGBLOCK  = 2
    BOX64_DYNAREC_FASTPAGE  = 1
