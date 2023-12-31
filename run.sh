#!/bin/bash

docker run -it --rm \
    --user 1000 \
    --network host \
    --ipc host \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --env=DISPLAY \
    --device=/dev/dri:/dev/dri \
    \
    ros-env-img:latest  $@ \
