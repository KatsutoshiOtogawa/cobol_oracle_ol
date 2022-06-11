#!/bin/bash
#
# build docker image for vscode devcontainer.

set -eu

## variavles
docker_registry=katsutoshiotogawa
docker_image_name=oracle
variant=8.6

# build and push docker iamge.
docker build . \
    -f Dockerfile.pre \
    -t ${docker_registry}/${docker_image_name}:oracle-linux-${variant} \
    --build-arg VARIANT=${variant}

docker image push ${docker_registry}/${docker_image_name}:oracle-linux-${variant} 
