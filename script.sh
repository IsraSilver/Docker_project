#!bin/bash
if [ ! "$(docker ps | grep alpcon:0.0.1)" ]; then
    # run container
        docker run -it alpcon:0.0.1
else echo "Container alredy running"
fi
