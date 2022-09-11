#!/bin/bash
if [ ! "$(docker ps | grep alpcon)" ]; then
    # run container
        docker run -v /home/work:/home/public --name must-die -d alpcon
else echo "Container alredy running"
fi
