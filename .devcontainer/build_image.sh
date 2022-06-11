#!/bin/bash

variant=8.6
docker build . \
    -f Dockerfile.pre \
    -t katsutoshiotogawa/oracle:oracle-linux-${variant} \
    --build-arg VARIANT=${variant}

docker image push katsutoshiotogawa/oracle:oracle-linux-${variant}
