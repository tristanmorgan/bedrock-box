#!/bin/sh

set -ex

NOMAD_META_VERSION=$1
docker build --pull --progress plain --no-cache --build-arg mcversion=${NOMAD_META_VERSION} -t registry.service.home.consul/bedrock-box:latest .

docker tag registry.service.home.consul/bedrock-box:latest registry.service.home.consul/bedrock-box:${NOMAD_META_VERSION}

docker push registry.service.home.consul/bedrock-box:latest
docker push registry.service.home.consul/bedrock-box:${NOMAD_META_VERSION}

echo done
