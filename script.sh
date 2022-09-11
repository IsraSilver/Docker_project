#!/bin/bash
if [ ! "$(docker ps | grep alpcon:0.0.1)" ]; then
    # run container
        docker run -v /home/work:/home/public -d alpcon
else echo "Container alredy running"
fi
