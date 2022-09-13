#!/bin/bash
if [ ! "$(docker ps | grep AlpCon)" ]; then
    # run container
        docker run -v /home/work:/home/public --name AlpCon -d alpcon
else echo "Container alredy running"
fi

