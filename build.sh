#!/bin/sh

docker build --pull --no-cache --build-arg mcversion=$1 -t tristanmorgan/bedrock-box:$1 -t tristanmorgan/bedrock-box:latest .
docker push tristanmorgan/bedrock-box:$1
docker push tristanmorgan/bedrock-box:latest
