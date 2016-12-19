#!/bin/bash

script="$0"
FOLDER="$(dirname $script)"

source $FOLDER/utils.sh
PROJECT_ROOT="$(abspath $FOLDER/..)"

echo "building Docker image in folder $PROJECT_ROOT"

docker build -f $PROJECT_ROOT/Dockerfile_standalone \
             -t dominicbreuker/traffic_light_example:latest \
             $PROJECT_ROOT

docker push dominicbreuker/traffic_light_example:latest
