#!/bin/bash

conName="ros-env"

# check for arguments
if [ $# -eq 0 ]
then
    echo "No container supplied. Defaulting to ros-env"

else
    conName=$1
    echo "creating container ${conName}" 
fi




docker run -itd --name ${conName} \
    --user 1000 \
    --network host \
    --ipc host \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --env=DISPLAY \
    --device=/dev/dri:/dev/dri \
    \
    ros-env-img:latest  ${@:2} \
