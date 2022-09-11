#!/bin/bash
if [ ! "$(docker ps | grep alpcon)" ]; then
    # run container
        docker run -v /home/work:/home/public -d alpcon
else echo "Container alredy running"
fi
