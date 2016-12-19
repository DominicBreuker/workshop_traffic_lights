#!/bin/bash

##### RUN #####
echo "Staring container..."

docker run -it \
           --rm \
           --name traffic_light_example \
           -p 8888:8888 \
           dominicbreuker/traffic_light_example:latest
