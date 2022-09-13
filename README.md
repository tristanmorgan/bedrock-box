# bedrock-box
A repackaging of [LomotHo/minecraft-bedrock](http://github.com/LomotHo/minecraft-bedrock/) but with Box64 emulation.

## Usage

Essentially the same as lomot's except this runs on ARM64 hosts.

    docker run -d --name bedrock -p 19132:19132/udp \
      -v /opt/mcpe-data:/data \
      tristanmorgan/bedrock-box:1.19.22.01

