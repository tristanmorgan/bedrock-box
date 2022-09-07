#!/bin/sh

docker build --pull --no-cache --build-arg mcversion=$1 -t tristanmorgan/bedrock-box:$1 -t tristanmorgan/bedrock-box:latest .

